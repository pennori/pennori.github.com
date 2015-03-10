package study.algorithm.graph;

public class DFSExample {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Graph graph = new Graph();
		
//		꼭지점을 만든다.
		Vertex A = new Vertex("A");
		Vertex B = new Vertex("B");
		Vertex C = new Vertex("C");
		Vertex D = new Vertex("D");
		Vertex E = new Vertex("E");
		Vertex F = new Vertex("F");
		Vertex G = new Vertex("G");
		Vertex H = new Vertex("H");

		// 꼭지점을 그래프에 추가한다.
		graph.addVertex(A);
		graph.addVertex(B);
		graph.addVertex(C);
		graph.addVertex(D);
		graph.addVertex(E);
		graph.addVertex(F);
		graph.addVertex(G);
		graph.addVertex(H);

		// 변을 그래프에 추가한다.
		graph.addEdge(A, B);
		graph.addEdge(A, F);
		graph.addEdge(A, G);
		graph.addEdge(B, C);
		graph.addEdge(B, D);
		graph.addEdge(D, E);
		graph.addEdge(G, H);

		graph.DFS(A);
	}

	static class Stack {
		// 스택을 저장할 수 있는 최대 항목 수
		final int MAX = 60;
		Object data[];
		int count;

		public Stack() {
			super();
			// 스택을 초기화한다.
			data = new Object[MAX];
			count = 0;
		}

		// 스택의 맨 뒤에 항목을 추가한다.
		public void insert(Object item) {
			data[count] = item;
			count += 1;
		}

		// 스택의 맨 위의 항목을 가져온다.
		public Object pop() {
			if (0 < count) {
				count -= 1;
			}

			return data[count];
		}

		// 스택이 비었는지의 여부를 반환한다.
		public boolean isEmpty() {
			if (0 == count) {
				return true;
			} else {
				return false;
			}
		}

	}

	static class Vertex {
		public String label;
		public boolean visitFlag;
		int id;

		public Vertex(String label) {
			// 꼭지점을 초기화한다.
			super();
			this.label = label;
			visitFlag = false;
			id = -1;
		}

		// 꼭지점의 번호를 반환한다.
		public int getId() {
			return id;
		}

		// 꼭지점의 번호를 설정한다.
		public void setId(int id) {
			this.id = id;
		}

		// 꼭지점을 방문했는지 방문 여부를 출력한다.
		public boolean isVisited() {
			return visitFlag;
		}

		// 꼭지점을 방문했음을 표기한다.
		public void setVisited() {
			this.visitFlag = true;
		}

		public void unSetVisited() {
			this.visitFlag = false;
		}

	}

	static class Graph {
		final int MAX = 50;

		// 인접 행렬
		int adjMat[][];
		// 꼭지점의 집합
		Vertex vertice[];
		public int numOfVertice;

		public Graph() {
			super();
			adjMat = new int[MAX][MAX];
			vertice = new Vertex[MAX];

			numOfVertice = 0;

			for (int i = 0; i < MAX; i++) {
				for (int j = 0; j < MAX; j++) {
					// 인접 행렬을 초기화
					adjMat[i][j] = 0;
				}
			}
		}

		public Vertex getVertex(int i) {
			return vertice[i];
		}

		public void addVertex(Vertex V) {
			// 꼭지점을 추가
			V.setId(numOfVertice);
			vertice[numOfVertice] = V;
			numOfVertice += 1;
		}

		public void addEdge(Vertex src, Vertex dst) {
			// 변을 추가
			adjMat[src.getId()][dst.getId()] = 1;
		}

		public void DFS(Vertex start) {
			Stack S = new Stack();
			S.insert(start);
			Vertex current;

			// 스택이 빌 때까지 수행한다.
			while (!S.isEmpty()) {

				current = (Vertex) S.pop();
				current.setVisited();

				// 탐색한 꼭지점을 출력한다.
				System.out.print(current.label + " ");

				for (int i = 0; i < numOfVertice; i++) {

					// 연결된 꼭지점을 찾는다.
					if (adjMat[current.getId()][i] == 1
							&& !vertice[i].isVisited()) {
						// 방문하지 않은 꼭지점이면 스택에 넣는다.
						S.insert(vertice[i]);
					}

				}

			}

			System.out.println("\n");
		}

	}

}
