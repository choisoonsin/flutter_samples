# exam_bloc_counter

Bloc의 기본적인 사용법을 숙지한다.

## Key Topics
- Observe state changes with `BlocObserver`.
- `BlocProvider`, Flutter widget which provides a bloc to its children.
- `BlocBuilder`, Flutter widget that handles building the widget in response to new states.
- Using Cubit instead of Bloc. What's the difference?
- Adding events with context.read.⚡

### 1. main 함수에 bloc zone 생성
```
void main() {
  BlocOverrides.runZoned(() => runApp(const CounterApp()),
      blocObserver: CounterObserver());
}
```

