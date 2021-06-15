const int maxs = 500;
const int maxc = 26;

List<int> out = List.filled(maxs, 0);
List<int> f = List.filled(maxs, 0);
List<List<int>> g = List.generate(maxs, (_) => List.filled(maxc, -1));

int buildMatchingMachine(List<String> arr, int k) {
  int states = 1;

  for (int i = 0; i < k; ++i) {
    String word = arr[i];
    int currentState = 0;
    for (int j = 0; j < word.length; ++j) {
      int ch = word.codeUnits[j] - "a".codeUnits[0];
      if (g[currentState][ch] == -1) {
        g[currentState][ch] = states++;
      }
      currentState = g[currentState][ch];
    }
    out[currentState] |= (1 << i);
  }
  for (int ch = 0; ch < maxc; ++ch) {
    if (g[0][ch] == -1) {
      g[0][ch] = 0;
    }
  }
  List<int> q = [];
  for (int ch = 0; ch < maxc; ++ch) {
    if (g[0][ch] != 0) {
      f[g[0][ch]] = 0;
      q.add(g[0][ch]);
    }
  }
  while (q.isNotEmpty) {
    int state = q.first;
    q.removeAt(0);
    for (int ch = 0; ch < maxc; ++ch) {
      if (g[state][ch] != -1) {
        int failure = f[state];
        while (g[failure][ch] == -1) {
          failure = f[failure];
        }
        failure = g[failure][ch];
        f[g[state][ch]] = failure;
        out[g[state][ch]] |= out[failure];
        q.add(g[state][ch]);
      }
    }
  }
  return states;
}

int findNextState(int currentState, String nextInput) {
  int answer = currentState;
  int ch = nextInput.codeUnits[0] - "a".codeUnits[0];
  while (g[answer][ch] == -1) {
    answer = f[answer];
  }
  return g[answer][ch];
}

void searchWords(List<String> arr, String text) {
  buildMatchingMachine(arr, arr.length);

  int currentState = 0;

  for (int i = 0; i < text.length; ++i) {
    currentState = findNextState(currentState, text[i]);
    if (out[currentState] == 0) {
      continue;
    }
    for (int j = 0; j < arr.length; ++j) {
      if ((out[currentState] & (1 << j)) > 0) {
        print("Word ${arr[j]} appears from ${(i - arr[j].length + 1)} to $i");
      }
    }
  }
}

void main(List<String> args) {
  List<String> list = ["muh", "ham", "dar", "arif", "suw"];
  String text = "muhamadarifsuwari";

  searchWords(list, text);
}
