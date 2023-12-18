import React, { useState } from "react";
import { Rating, Heart } from "@smastrom/react-rating";
import "@smastrom/react-rating/style.css";

function UserBook(props) {
    const statuss = JSON.parse(props.status);
    const userBook = JSON.parse(props.userBook);
    console.log(props.action)
   
    // Declare it outside your component so it doesn't get re-created
    const rateStyles = {
        itemShapes: Heart,
        activeFillColor: "#ff0000",
        inactiveFillColor: "#797978",
    };

    const textAreaStyle = {
        background: "linear-gradient(300deg, #edebeb39 30%, #f0ddd39d 90%)",
        border: 0,
        borderRadius: 3,
        boxShadow: "0 3px 5px 2px rgba(37, 37, 37, 0.174)",
        // height: 48,
        padding: "4px 8px",
        fontSize: "12px",
        //   resize: 'none',
        color: "#000000",
    };

    const [commentTitle, setCommentTitle] = useState(userBook.commentTitle); 
    const [note, setNote] = useState(userBook.note); // initial rating value
    const [comment, setComment] = useState(userBook.comment);
    const [statusId, setStatusId] = useState(userBook.status.id);

    const handleNote = (note) => {
        setNote(note);
    };

    const handleComment = (e) => {
        setComment(e.target.value);
    };

    const handleCommentTitle = (e) => {
        setCommentTitle(e.target.value);
    };

    const handleStatus = (e) => {
        setStatusId(e.target.value);
    };

    return (
        <div>
            <form
                action = {props.action}
                // action = {`/userbook/${userBook.id}/edit`}
                className="bg-slate-200 m-5 p-3 text-left pl-10"
                // onSubmit={(e) => handleSubmit(e)}
                method="post"
            >
                <div className="mb-3">
                    <label>Mon Statut : </label>
                    <select
                        value={statusId}
                        className="rounded px-2 py-1 bg-stone-200"
                        name="status"
                        onChange={(e) => handleStatus(e)}
                    >
                        {statuss.map((status) => {
                            return (
                                <option
                                    // selected={status.id === statusId}
                                    value={status.id}
                                    key={status.id}
                                >
                                    {status.name}
                                </option>
                            );
                        })}
                    </select>
                </div>
                <div className="flex mb-3">
                    <label htmlFor="">Ma note : </label>
                    <Rating
                        onChange={(e) => handleNote(e)}
                        className="h-[16px] w-[150px]  mt-1 my-2 ml-4"
                        value={note}
                        itemStyles={rateStyles}
                        transition="opacity" 
                    />
                    <input onChange={(e) => handleNote(e)}  name="note" type="number" value={note} className="hidden" />
                </div>
                <div className="mb-3">
                    <label className="text-left block w-[75%] " htmlFor="comment-title">
                            Titre de commentaire :
                    </label>
                    <input 
                    id="comment-title"
                    name="commentTitle"
                    type="text"
                    className="placeholder-black-400 block w-[80%]  px-3 py-1 rounded-lg bg-gray-100"
                    placeholder="Entrez le titre de votre commentaire ..."
                    value={commentTitle ? commentTitle : ""}
                    onChange={(e) => handleCommentTitle(e)} />
                </div>
                <div>
                    <label className="text-left block w-[75%] " htmlFor="comment">
                        Mon commentaire :
                    </label>
                    {/* <Rating name='note' onClick={(e)=>handleNote(e)} transition ratingValue={note} size="20" fillColor="#0D6EFD" /> */}
                    <textarea
                        id="comment"
                        rows="6"
                        style={textAreaStyle}
                        className="placeholder-black-400 block w-[80%]  p-3 rounded-xl bg-slate-200"
                        name="comment"
                        onChange={(e) => handleComment(e)}
                        value={comment ? comment : ""}
                        placeholder="Entrez votre commentaire sur ce livre ..."
                        type="text"
                    />
                </div>
                <div className="my-3">
                    <button
                        type="submit"
                        className="btn-primary bg-green-200 hover:bg-green-400  "
                    >
                        Enregistrer
                    </button>
                </div>
            </form>
        </div>
    );
}
export default UserBook;
