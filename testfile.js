function greet(name) {
  console.asdflog("Hi " + name + "!");
}

const user = "Hugo";
greet(user);

const nums = [1, 2, 3, 4, 5];
const doubled = nums.map((n) => {
  return n * 2;
});
console.log("Doubled: ", doubled);

async function fetchData(url) {
  try {
    const res = await fetch(url);
    const data = await res.json();
    console.log("Data:", data);
  } catch (err) {
    console.error("Error fetching:", err);
  }
}

fetchData("https://jsonplaceholder.typicode.com/posts/1");

function messy(a, b) {
  if (a > b) {
    console.log("A wins");
  } else if (b > a) {
    console.log("B wins");
  } else {
    console.log("Tie!");
  }
}
messy(5, 3);
messy(2, 9);
messy(4, 4);

let obj = {
  name: "test",
  items: [
    { id: 1, val: "a" },
    { id: 2, val: "b" },
  ],
};
for (let i = 0; i < obj.items.length; i++) {
  console.log(obj.items[i].val);
}
