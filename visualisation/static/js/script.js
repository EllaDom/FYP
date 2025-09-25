document.addEventListener("DOMContentLoaded", function() {
    // Initialize default tab
    openTab('UserGraphs');

    // Populate CAPEC select
    let capecSelect = document.getElementById("capecSelect");
    for(let i=1;i<=20;i++){
        let option = document.createElement("option");
        option.value = i;
        option.text = "CAPEC-"+i;
        capecSelect.add(option);
    }

    // Load initial graphs
    document.getElementById("user1").src="/graph/user1";
    document.getElementById("user2").src="/graph/user2";
    document.getElementById("canonical").src="/graph/canonical";
    loadCAPEC();
    loadThreats();
});

function openTab(tabName) {
    let tabs = document.getElementsByClassName("tabcontent");
    for(let t of tabs) t.style.display="none";
    document.getElementById(tabName).style.display="block";
}

function loadCAPEC() {
    let val = document.getElementById("capecSelect").value;
    document.getElementById("capecFrame").src="/graph/capec_"+val;
}

function loadThreats(){
    let top = document.getElementById("topN").value;
    fetch(`/threats?top=${top}`)
    .then(resp=>resp.json())
    .then(data=>{
        let tbody = document.querySelector("#threatTable tbody");
        tbody.innerHTML="";
        data.forEach(row=>{
            let tr = document.createElement("tr");
            tr.innerHTML = `<td>${row.CAPEC_ID}</td><td>${row.Description}</td><td>${row.Score}</td>`;
            tbody.appendChild(tr);
        });
    });
}
