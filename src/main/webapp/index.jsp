<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width,initial-scale=1" />
<title>NexusShop — Modern UI</title>

<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600&family=Poppins:wght@600;700&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

<style>
:root{
 --bg:#020617;
 --primary:#fff;
 --accent:#6366f1;
 --accent2:#22c55e;
 --muted:#94a3b8;
 --card:rgba(255,255,255,0.05);
 --border:rgba(255,255,255,0.1);
 --radius:16px;
}

body{
 margin:0;
 font-family:Inter;
 background:radial-gradient(circle at top,#0f172a,#020617);
 color:var(--primary);
}

/* HEADER */
header{
 position:sticky;top:0;
 backdrop-filter:blur(12px);
 background:rgba(2,6,23,.7);
 border-bottom:1px solid var(--border);
}

.container{max-width:1200px;margin:auto;padding:16px;}

.header-inner{display:flex;justify-content:space-between;align-items:center;}

.brand{font-family:Poppins;font-size:22px;font-weight:700;}
.brand span{color:var(--accent)}

.search{
 background:var(--card);
 padding:8px 14px;
 border-radius:999px;
 border:1px solid var(--border);
}

.search input{
 background:transparent;border:0;color:white;outline:none;
}

/* HERO */
.hero{
 text-align:center;
 padding:100px 20px;
}

.hero h1{
 font-size:48px;
 background:linear-gradient(to right,#6366f1,#22c55e);
 -webkit-background-clip:text;
 color:transparent;
}

.hero p{color:var(--muted)}

.btn{
 padding:10px 20px;
 border-radius:999px;
 border:0;
 cursor:pointer;
}

.btn-primary{
 background:linear-gradient(135deg,#6366f1,#22c55e);
 color:white;
}

/* GRID */
.grid{display:grid;gap:20px}
.products{grid-template-columns:repeat(auto-fit,minmax(240px,1fr));}

.product{
 background:var(--card);
 border:1px solid var(--border);
 border-radius:var(--radius);
 overflow:hidden;
 transition:.3s;
}

.product:hover{
 transform:translateY(-8px);
 box-shadow:0 20px 40px rgba(0,0,0,.4);
}

.product img{
 width:100%;height:200px;object-fit:cover;
 transition:.4s;
}
.product:hover img{transform:scale(1.08)}

.product-body{padding:12px}

.price{font-weight:700}

.add-btn{
 width:100%;
 background:var(--accent);
 color:white;
 border:0;
 padding:10px;
 border-radius:8px;
 cursor:pointer;
}

footer{
 text-align:center;
 color:var(--muted);
 padding:20px;
}
</style>
</head>

<body>

<header>
 <div class="container header-inner">
  <div class="brand">Nexus<span>Shop</span></div>
  <div class="search">
   <input id="searchInput" placeholder="Search...">
  </div>
 </div>
</header>

<section class="hero">
 <h1>Premium Collection</h1>
 <p>Modern shopping experience with stunning UI</p>
 <button class="btn btn-primary">Shop Now</button>
</section>

<section class="container">
 <h2>Trending Products</h2>
 <div class="grid products" id="productsGrid"></div>
</section>

<footer>
 © 2026 NexusShop
</footer>

<script>
const PRODUCTS=[
 {id:1,title:'iPhone 14',price:999,img:'https://images.unsplash.com/photo-1601784551446-20c9e07cdbdb'},
 {id:2,title:'MacBook Pro',price:1999,img:'https://images.unsplash.com/photo-1593642632823'},
 {id:3,title:'Headphones',price:299,img:'https://images.unsplash.com/photo-1600185365483'},
 {id:4,title:'Sneakers',price:150,img:'https://images.unsplash.com/photo-1542272604'}
];

const grid=document.getElementById('productsGrid');
const search=document.getElementById('searchInput');

function render(list){
 grid.innerHTML='';
 list.forEach(p=>{
  const el=document.createElement('div');
  el.className='product';
  el.innerHTML=`
   <img src="${p.img}">
   <div class="product-body">
    <h4>${p.title}</h4>
    <div class="price">$${p.price}</div>
    <button class="add-btn">Add to Cart</button>
   </div>
  `;
  grid.appendChild(el);
 });
}

search.addEventListener('input',()=>{
 const q=search.value.toLowerCase();
 render(PRODUCTS.filter(p=>p.title.toLowerCase().includes(q)));
});

render(PRODUCTS);
</script>

</body>
</html>
