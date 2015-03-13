package study.algorithm.graph.advanced;

/**
 * DFS 를 기반으로 최소 신장 트리를 구한다.
 * 
 * @author HSSON
 * 
 */
public class MSTExample {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Graph graph = new Graph();

		// 꼭지점을 만든다.
		Vertex A = new Vertex("A");
		Vertex B = new Vertex("B");
		Vertex C = new Vertex("C");
		Vertex D = new Vertex("D");
		Vertex E = new Vertex("E");

		// 꼭지점을 그래프에 추가한다.
		graph.addVertex(A);
		graph.addVertex(B);
		graph.addVertex(C);
		graph.addVertex(D);
		graph.addVertex(E);

		// 변을 그래프에 추가한다.
		graph.addEdge(A, B);
		graph.addEdge(A, D);
		graph.addEdge(B, C);
		graph.addEdge(B, D);
		graph.addEdge(B, E);
		graph.addEdge(C, D);
		graph.addEdge(D, E);

		// 최소 신장 트리를 수행한다.
		graph.MST(A);
	}

	static class Stack {
		// 스택에 저장할 수 있는 최대 항목 수
		final int MAX = 60;
		Object[] data;
		int count;

		public Stack() {
			super();
			// 스택을 초기화 한다.
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
			if (count > 0) {
				count -= 1;
			}

			return data[count];
		}

		// 스택이 비었는지의 여부를 반환한다.
		public boolean isEmpty() {
			if (count == 0) {
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
		public void unSetVisited() {
			visitFlag = false;
		}

	}

	static class Graph {
		final int MAX = 50;

		// 인접 행렬
		int adjMat[][];
		// 그래프에 포함된 꼭지
		Vertex[] vertice;
		// 꼭지점의 개수
		public int numOfVertice;

		// 방향 그래프의 여부
		boolean isDirected;

		public Graph() {
			super();
			int i, j;
			adjMat = new int[MAX][MAX];
			vertice = new  Vertex[MAX];

			numOfVertice = 0;
			isDirected = false;

			// 꼭지점을 초기화한다.
			for (i = 0; i < MAX; i++) {

				for (j = 0; j < MAX; j++) {
					adjMat[i][j] = 0;
				}

			}
		}
		
		public Vertex getVertex(int i) {
			return vertice[i];
		}
		
		// 그래프에 꼭지점을 추가한다.
		public void addVertex(Vertex V) {
			V.setId(numOfVertice);
			vertice[numOfVertice] = V;
			numOfVertice += 1;
		}

		// 그래프에 변을 추가한다.
		public void addEdge(Vertex src, Vertex dst){
			adjMat[src.getId()][dst.getId()] = 1;

//			방향 그래프가 아니면 반대 방향도 연결
			if (!isDirected) {
				adjMat[dst.getId()][src.getId()] = 1;
			}
		}

		// 방향 그래프를 설정한다.
		public void setDirected() {
			isDirected = true;
		}

		// 방향 없는 그래프를 설정한다.
		public void unSetDirected() {
			isDirected = false;
		}

		public void MST(Vertex start) {
			int i;
			Stack S = new Stack();

			// 스택에 시작 꼭지점을 넣고 시작한다.
			S.insert(start);
			Vertex current;

			// 스택을 방문했음으로 표기하여 집합에 포함시킨다.
			start.setVisited();

			while (!S.isEmpty()) {
				// 스택에서 꼭지점을 하나 가져온다.
				current = (Vertex) S.pop();

				for (i = 0; i < numOfVertice; i++) {
					// 현재 꼭지점과 연결되어있고 집합에 포함된 꼭지점이 아니라면
					if (adjMat[current.getId()][i] == 1
							&& !vertice[i].isVisited()) {
						// 스택에 넣고
						S.insert(vertice[i]);
						// 집합에 포함시킨다.
						vertice[i].setVisited();
						// 이 변은 MST 에 포함되므로 출력한다.
						System.out.println(current.label + " - "
								+ vertice[i].label);
					}
				}
			}
			System.out.print("\n");
		}

	}

}
