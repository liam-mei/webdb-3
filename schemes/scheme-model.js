const knex = require("knex");

const config = require("../knexfile.js");

const db = knex(config.development);

function find() {
  return db("schemes");
}

function findById(id) {
  return db("schemes")
    .where({ id })
    .first();
}

function findSteps(scheme_id) {
  db("steps")
    .where({ scheme_id })
    .orderBy("step_number");
}

async function add(scheme) {
  const [id] = await db("schemes").insert(scheme);
  return findById(id);
}

async function update(changes, id) {
  await db("schemes")
    .where({ id })
    .update(changes);
  return findById(id);
}

async function remove(id) {
  const scheme = await findById(id);
  await db("schemes")
    .where({ id })
    .del();
  return scheme;
}

function remove2(id) {
  db.findById(id).then(scheme => {
    db("schemes")
      .where({ id })
      .del()
      .then(() => scheme);
  });
}

module.exports = {
  find,
  findById,
  findSteps,
  add,
  update,
  remove,
  remove2
};
