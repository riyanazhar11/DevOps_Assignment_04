import mongoose from 'mongoose';

const Connection = async () => {
    const DB_LINK = 'mongodb://user1:user1@ac-ahudh1z-shard-00-00.lzkch3r.mongodb.net:27017,ac-ahudh1z-shard-00-01.lzkch3r.mongodb.net:27017,ac-ahudh1z-shard-00-02.lzkch3r.mongodb.net:27017/Whatsapp?replicaSet=atlas-1zh0dp-shard-0&ssl=true&authSource=admin';
    try {
        await mongoose.connect(DB_LINK, { useUnifiedTopology: true, useNewUrlParser: true, useFindAndModify: false });
        console.log('Database Connected Successfully');
    } catch(error) {
        console.log('Error: ', error.message);
    }
};

export default Connection;
