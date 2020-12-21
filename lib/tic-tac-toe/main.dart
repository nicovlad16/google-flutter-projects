import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tic-Tac-Toe',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: 'Tic-Tac-Toe'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final int _gridSize = 3;
  List<List<int>> board;

  bool endGame = false;
  bool firstPlayer;
  int firstPlayerTile = 1;
  int secondPlayerTile = -1;

  int lastTile;
  int countMoves;

  String message;

  @override
  void initState() {
    if (!endGame) {
      super.initState();
    }

    board = List<List<int>>.generate(_gridSize, (_) => List<int>.generate(_gridSize, (_) => 0));

    firstPlayer = true;
    endGame = false;

    lastTile = null;
    countMoves = 0;

    message = "Player 1's turn";
  }

  int _line(int index) {
    return index ~/ _gridSize;
  }

  int _column(int index) {
    return index % _gridSize;
  }

  bool _isEmptyTile(int index) {
    return board[_line(index)][_column(index)] == 0;
  }

  bool _isFirstPlayerTile(int index) {
    return board[_line(index)][_column(index)] == firstPlayerTile;
  }

  bool _isGameWon() {
    bool isGameWon = false;

    if (lastTile != null) {
      final int line = _line(lastTile);
      final int column = _column(lastTile);

      final int expectedSum = firstPlayer ? _gridSize * firstPlayerTile : _gridSize * secondPlayerTile;

      if (_computeLineSum(line) == expectedSum) {
        isGameWon = true;
        _clearBoardIfLine(line);
      } else if (_computeColumnSum(column) == expectedSum) {
        isGameWon = true;
        _clearBoardIfColumn(column);
      } else if (_computeDiagonalSum(line, column) == expectedSum) {
        isGameWon = true;
        _clearBoardIfDiagonal();
      } else if (_computeReverseDiagonalSum(line, column) == expectedSum) {
        isGameWon = true;
        _clearBoardIfReverseDiagonal();
      }
    }

    return isGameWon;
  }

  void _clearBoardIfLine(int row) {
    for (int line = 0; line < _gridSize; line++) {
      for (int column = 0; column < _gridSize; column++) {
        if (line != row) {
          board[line][column] = 0;
        }
      }
    }
  }

  void _clearBoardIfColumn(int column) {
    for (int line = 0; line < _gridSize; line++) {
      for (int col = 0; col < _gridSize; col++) {
        if (col != column) {
          board[line][col] = 0;
        }
      }
    }
  }

  void _clearBoardIfDiagonal() {
    for (int line = 0; line < _gridSize; line++) {
      for (int column = 0; column < _gridSize; column++) {
        if (line != column) {
          board[line][column] = 0;
        }
      }
    }
  }

  void _clearBoardIfReverseDiagonal() {
    for (int line = 0; line < _gridSize; line++) {
      for (int column = 0; column < _gridSize; column++) {
        if (line + column != _gridSize - 1) {
          board[line][column] = 0;
        }
      }
    }
  }

  int _computeLineSum(int line) {
    return board[line].reduce((int sum, int element) => sum + element);
  }

  int _computeColumnSum(int column) {
    int sum = 0;
    for (final List<int> row in board) {
      sum += row[column];
    }
    return sum;
  }

  int _computeDiagonalSum(int line, int column) {
    int sum = 0;
    if (line == column) {
      for (int i = 0; i < _gridSize; i++) {
        sum += board[i][i];
      }
    }
    return sum;
  }

  int _computeReverseDiagonalSum(int line, int column) {
    int sum = 0;
    if (line + column == _gridSize - 1) {
      for (int i = 0; i < _gridSize; i++) {
        sum += board[i][_gridSize - i - 1];
      }
    }
    return sum;
  }

  bool _isDraw() {
    return countMoves == _gridSize * _gridSize;
  }

  void _playTurn(int tile) {
    print(board);

    setState(() {
      board[_line(tile)][_column(tile)] = firstPlayer ? firstPlayerTile : secondPlayerTile;
    });

    lastTile = tile;
    countMoves++;

    if (_isDraw()) {
      setState(() {
        message = 'Draw!';
        endGame = true;
      });
    }

    if (_isGameWon()) {
      setState(() {
        message = firstPlayer ? 'Player 1 wins!' : 'Player 2 wins!';
        endGame = true;
      });
    }

    if (!endGame) {
      setState(() {
        firstPlayer = !firstPlayer;
        message = firstPlayer ? "Player 1's turn" : "Player 2's turn";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 400.0,
            child: GridView.builder(
              itemCount: _gridSize * _gridSize,
              padding: const EdgeInsets.all(16.0),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: _gridSize, mainAxisSpacing: 8.0, crossAxisSpacing: 8.0, childAspectRatio: 1.0),
              itemBuilder: (BuildContext context, int index) {
                return RaisedButton(
                  onPressed: endGame || !_isEmptyTile(index)
                      ? () {}
                      : () {
                          _playTurn(index);
                        },
                  color: _isEmptyTile(index)
                      ? Colors.grey[300]
                      : (_isFirstPlayerTile(index) ? Colors.yellow : Colors.black),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(32.0),
            child: Column(
              children: <Widget>[
                if (message != null)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Text(message, style: Theme.of(context).textTheme.headline4),
                  ),
                if (endGame)
                  RaisedButton(
                    onPressed: () {
                      setState(() {
                        initState();
                      });
                    },
                    child: const Text('Play Again'),
                  )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
