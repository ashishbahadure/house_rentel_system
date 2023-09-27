var express = require("express");
var router = express.Router();

var execute = require("./../db_connection");
var url = require("url");
// const session = require("express-session");

  
router.get("/",async function(req,res){
    room_det = await execute(`select * from room_tbl,room_img_tbl,room_address_tbl where room_tbl.room_id=room_img_tbl.room_id and room_tbl.room_id=room_address_tbl.room_id;`);
    obj = {'room_det':room_det};
    res.render("user_views/home.ejs",obj);
});

router.get("/login",async function(req,res){
    res.render("user_views/login_form.ejs");
});

router.post("/verify_login",async function(req,res){
    data = req.body;
    // result = await execute(`select * from user_tbl where user_mobile='${data.user_mobile}' and user_password='${data.user_password}'`);
    if(result.length <= 0){
        res.send(`
            <script>
                alert("Login Failed");
                history.back();
            </script>`);
    }
    else{
        req.session.user_id = result[0].user_id;
        req.session.user_name = result[0].user_name;
        res.redirect('/');
    }
});

// router.get("/home",async function(req,res){
//     if(req.session.user_id != undefined){
//         res.send(req.session.user_name+"Loged In");
//     }
//     else{
//         res.redirect("/login");
//     }
// });

router.post("/register_user",async function(req,res){
    data = req.body;
    sql = `insert into user_tbl (user_name,user_mobile,user_email,user_password) values ('${data.user_name}','${data.user_mobile}','${data.user_email}','${data.user_password}');`;
    // await execute(sql);
    res.redirect("/login");
});

router.get("/logout",async function(req,res){
    req.session.user_id = undefined;
    req.session.room_id = undefined;
    res.redirect("/");
});

router.get("/room_details/:q",async function(req,res){
    id = req.params.q;
    // room_det = await execute(`select * from room_tbl,room_img_tbl,room_address_tbl where room_tbl.room_id=room_img_tbl.room_id and room_tbl.room_id=room_address_tbl.room_id and room_tbl.room_id=${id};`);
    // obj = {'room_det':room_det};
    res.send("room details");
});

router.get("/post_room",async function(req,res){
    // if(req.session.user_id == undefined){
    //     res.redirect("/login");
    // }
    // else
    {
        res.render("user_views/post_room.ejs");
    }
});

router.get("/private_room",async function(req,res){
    // if(req.session.user_id == undefined){
    //     res.redirect("/login");
    // }
    // else
    {
        res.render("user_views/private_room_form.ejs");
    }
});

router.get("/shared_room",async function(req,res){
    // if(req.session.user_id == undefined){
    //     res.redirect("/login");
    // }
    // else
    {
        res.render("user_views/shared_room_form.ejs");
    }
});

router.post("/save_posted_room",async function(req,res){
    data = req.body;
    if(data.room_type == 'private'){
        sql = `insert into room_tbl (user_id,room_type,property_type,rent,deposit,electricity,available_from,current_occupancy,available_occupancy,preference,owner_mobile,room_desc,available_now) values ('${req.session.user_id}','private','${data.property_type}','${data.rent}','${data.deposit}','${data.electricity}','${data.available_from}','0','full','Family','${data.owner_mobile}','${data.room_desc}','yes');`;
        // query = await execute(sql);
        // req.session.room_id = query.insertId;
        // req.session.room_id = 2;
        sql = `insert into room_condition_tbl (room_id,no_smoking,no_drinking,no_pets,vegetarian,no_visitors) values ('${req.session.room_id}','${(data.no_smoking=='on')?'yes':'no'}','${(data.no_drinking=='on')?'yes':'no'}','${(data.no_pets=='on')?'yes':'no'}','${(data.vegetarian=='on')?'yes':'no'}','${(data.no_visitors=='on')?'yes':'no'}');`;
        // await execute(sql);
        sql = `insert into room_address_tbl (room_id,appartment_house,landmark,area,city_village,dist,state,country,pincode) values ('${req.session.room_id}','${data.appartment_house}','${data.landmark}','${data.area}','${data.city_village}','${data.dist}','${data.state}','${data.country}','${data.pincode}');`;
        // await execute(sql);
        res.redirect('/room_img');
        
    }
    else if(data.room_type == 'shared'){
        sql = `insert into room_tbl (user_id,room_type,property_type,rent,deposit,electricity,available_from,current_occupancy,available_occupancy,preference,owner_mobile,room_desc,available_now) values ('${req.session.user_id}','private','${data.property_type}','${data.rent}','${data.deposit}','${data.electricity}','${data.available_from}','0','full','Family','${data.owner_mobile}','${data.room_desc}','yes');`;
        // query = await execute(sql);
        req.session.room_id = query.insertId;
        // req.session.room_id = 2;
        sql = `insert into room_condition_tbl (room_id,no_smoking,no_drinking,no_pets,vegetarian,no_visitors) values ('${req.session.room_id}','${(data.no_smoking=='on')?'yes':'no'}','${(data.no_drinking=='on')?'yes':'no'}','${(data.no_pets=='on')?'yes':'no'}','${(data.vegetarian=='on')?'yes':'no'}','${(data.no_visitors=='on')?'yes':'no'}');`;
        // await execute(sql);
        sql = `insert into room_address_tbl (room_id,appartment_house,landmark,area,city_village,dist,state,country,pincode) values ('${req.session.room_id}','${data.appartment_house}','${data.landmark}','${data.area}','${data.city_village}','${data.dist}','${data.state}','${data.country}','${data.pincode}');`;
        // await execute(sql);
        res.redirect('/room_img');
    }
    res.redirect('/room_img');
});

router.get("/room_img",function(req,res){
    res.render("user_views/upload_room_img.ejs");
})
router.post("/upload_room_img",async function(req,res){
    

    // if(req.session.user_id == undefined){
    //     res.redirect("/login");
    // }
    // else
    {
        room_id = req.session.room_id;
        sql = `insert into room_img_tbl (room_id,img1,img2,img3,img4,img5) values ('${room_id}','${0}','${0}','${0}','${0}','${0}');`;
        // await execute(sql);
        // for(i=0;i<5;i++){
        //     let dyName = "img"+parseInt(i+1);
        //     let image = req.files.img[i];
        //     if(image!=undefined){
        //         sql = `update room_img_tbl set ${dyName} = '${image.name}' where room_id='${room_id}'`;
        //         // await execute(sql);
        //         // image.mv("public/room_img/"+image.name);
        //         console.log(sql);
        //     }
        //     else{
        //         break;
        //     }
        // }

        res.send(`
            <script>
                alert("Your room has been posted Successfully....");
                location.href="/";
            </script>
        `);
        // res.render("user_views/private_room_form.ejs");
    }

})

router.get('/demo',function(req,res){
    res.render("user_views/room_address.ejs")
});
router.post("/test",function(req,res){
    data = req.body;
    res.send(req.files.img);
})
module.exports = router;
