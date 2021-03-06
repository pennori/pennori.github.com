package study.algorithm.graph;

public class BFSExample {

	public static void main(String[] args) {
		Graph graph = new Graph();
		
//		꼭지점을 만든다
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

		graph.BFS(A);
	}

	static class Queue {
		// 큐의 자료공간
		Object[] data;
		final int MAX = 60;
		int front;
		int rear;

		public Queue() {
			super();
			// 큐를 초기화한다.
			data = new Object[MAX];
			front = 0;
			rear = 0;
		}

		// 큐에 새 항목을 추가한다.
		public void insert(Object item) {
			data[rear] = item;

			if (rear < MAX) {
				rear += 1;
			}
		}

		// 큐의 맨 앞에서 항목을 가져온다.
		public Object get() {
			if (front < MAX) {
				front += 1;
			}

			return data[front - 1];
		}

		// 큐가 비었는지의 여부를 반환한다.
		public boolean isEmpty() {
			if (front == rear) {
				return true;
			}
			return false;
		}

	}
	
	static class Vertex {
		// 꼭지점 이름
		public String label;
		// 방문 여부를 표시를 위한 변수
		public boolean visitFlag;
		// 꼭지점의 고유 번호
		int id;

		public Vertex(String label) {
			super();
			// 꼭지점을 초기화한다.
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
			visitFlag = true;
		}

		// 꼭지점을 방문하지 않음을 표기한다.
		public void unsetVisited() {
			visitFlag = false;
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
			int i, j;
			adjMat = new int[MAX][MAX];
			vertice = new Vertex[MAX];
			numOfVertice = 0;
			
			for (i = 0; i < MAX; i++) {
				
				for (j = 0; j < MAX; j++) {
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

		public void addEdge(Vertex src, Vertex dst){
			// 변을 추가
			adjMat[src.getId()][dst.getId()] = 1;
		}

		public void BFS(Vertex start) {
			int i;
			Queue Q = new Queue();
			Q.insert(start);
			Vertex current;

			while (!Q.isEmpty()) {
				current = (Vertex) Q.get();
				current.setVisited();

				// 탐색한 꼭지점을 출력한다.
				System.out.print(current.label + " ");

				// 연결된 꼭지점을 찾는다.
				for (i = 0; i < numOfVertice; i++) {

					if (adjMat[current.getId()][i] == 1
							&& !vertice[i].isVisited()) {
						// 방문하지 않은 꼭지점이면 큐에 넣는다.
						Q.insert(vertice[i]);
					}

				}
			}

			System.out.print("\n");

		}

	}

}
