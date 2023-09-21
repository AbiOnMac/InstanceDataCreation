// http://blog.thomsonreuters.com/index.php/mobile-patent-suits-graphic-of-the-day/

$(document).ready(function () {
  let links = [];

  // Example usage
  $("#generateButton").click(function () {
    callGenerator();
  });
});

async function fetchData() {
  try {
    const id = $("#selectOption").val();
    console.log(`selected    :   ${id}`);
    const response = await fetch(`/generator/${id}`);
    if (!response.ok) {
      throw new Error("Network response was not ok.");
    }

    const data = await response.json();
    // Transform the data into the desired format
    const transformedData = data.map((item) => ({
      source: item.source,
      target: item.target,
    }));

    return transformedData;
  } catch (error) {
    console.error("Error fetching data:", error.message);
    throw error;
  }
}

function callGenerator() {
  // Show the spinner
  $(".graph-box").html('<div class="spinner"></div>');

  // Generate a random duration between 3 to 5 seconds
  const randomDuration = Math.floor(Math.random() * (5000 - 3000 + 1) + 3000);

  // Delay the execution by the random duration
  setTimeout(() => {
    // Fetch data after the random duration
    fetchData()
      .then((links) => {
        main(links);
      })
      .catch((error) => {
        console.error("An error occurred:", error.message);
      });
  }, randomDuration);
}

// function callGenerator() {
//   // Example usage
//   fetchData()
//     .then((links) => {
//       main(links);
//     })
//     .catch((error) => {
//       console.error("An error occurred:", error.message);
//     });
// }

function main(links) {
  var nodes = {};

  // Compute the distinct nodes from the links.
  links.forEach(function (link) {
    link.source =
      nodes[link.source] || (nodes[link.source] = { name: link.source });
    link.target =
      nodes[link.target] || (nodes[link.target] = { name: link.target });
  });

  var width = 500,
    height = 500;

  var force = d3.layout
    .force()
    .nodes(d3.values(nodes))
    .links(links)
    .size([width, height])
    .linkDistance(60)
    .charge(-300)
    .on("tick", tick)
    .start();

  $(".graph-box").html("");

  var svg = d3
    .select(".graph-box")
    .append("svg")
    .attr("width", width)
    .attr("height", height);

  var link = svg
    .selectAll(".link")
    .data(force.links())
    .enter()
    .append("line")
    .attr("class", "link");

  var node = svg
    .selectAll(".node")
    .data(force.nodes())
    .enter()
    .append("g")
    .attr("class", "node")
    .on("mouseover", mouseover)
    .on("mouseout", mouseout)
    .call(force.drag);

  node.append("circle").attr("r", 8);

  node
    .append("text")
    .attr("x", 12)
    .attr("dy", ".35em")
    .text(function (d) {
      return d.name;
    });

  function tick() {
    link
      .attr("x1", function (d) {
        return d.source.x;
      })
      .attr("y1", function (d) {
        return d.source.y;
      })
      .attr("x2", function (d) {
        return d.target.x;
      })
      .attr("y2", function (d) {
        return d.target.y;
      });

    node.attr("transform", function (d) {
      return "translate(" + d.x + "," + d.y + ")";
    });
  }

  function mouseover() {
    d3.select(this).select("circle").transition().duration(750).attr("r", 16);
  }

  function mouseout() {
    d3.select(this).select("circle").transition().duration(750).attr("r", 8);
  }
}
