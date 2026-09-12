const users = [
  { id: 1, name: "Alice", role: "Developer", active: true },
  { id: 2, name: "Bob", role: "Designer", active: false },
  { id: 3, name: "Charlie", role: "Manager", active: true },
];

function UserCard({ user, onSelect }) {
  return (
    <article className={`user-card ${user.active ? "active" : "inactive"}`}>
      <h2>{user.name}</h2>
      <p>{user.role}</p>

      <button onClick={() => onSelect(user)}>Select</button>

      {user.active && <span className="status">Online</span>}
    </article>
  );
}

export default function App() {
  const [selectedUser, setSelectedUser] = useState(null);
  const [count, setCount] = useState(0);
  const [query, setQuery] = useState("");

  const filteredUsers = users.filter((user) =>
    user.name.toLowerCase().includes(query.toLowerCase()),
  );

  return (
    <main className="app">
      <header>
        <h1>Test Dashboard</h1>
        <p>Example JSX file for testing.</p>
      </header>

      <section className="controls">
        <input
          type="text"
          value={query}
          placeholder="Search users..."
          onChange={(event) => setQuery(event.target.value)}
        />

        <button onClick={() => setCount((value) => value + 1)}>
          Clicked {count} times
        </button>
      </section>

      <section className="user-list">
        {filteredUsers.map((user) => (
          <UserCard key={user.id} user={user} onSelect={setSelectedUser} />
        ))}
      </section>

      {selectedUser && (
        <aside className="selected-user">
          <h2>Selected User</h2>
          <p>
            <strong>Name:</strong> {selectedUser.name}
          </p>
          <p>
            <strong>Role:</strong> {selectedUser.role}
          </p>
          <button onClick={() => setSelectedUser(null)}>Close</button>
        </aside>
      )}
    </main>
  );
}
