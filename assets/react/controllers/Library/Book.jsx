import React, { useState } from "react";
import dayjs from "dayjs";
import { Rating, Heart } from "@smastrom/react-rating";
import "@smastrom/react-rating/style.css";

import {ArrayAvgNote} from '../Services/Functions'

function Book({ book, currentUser }) {
    // Declare it outside your component so it doesn't get re-created
    const rateStyles = {
        itemShapes: Heart,
        activeFillColor: "#ff0000",
        inactiveFillColor: "#acaba1",
    };

    const currentUserList = book.userBooks.filter(
        (userBook) => userBook.user.pseudo == currentUser
    );



    const note =  ArrayAvgNote(book.userBooks);
    //console.log(note)
    const [showModal, setShowModal] = useState(false);

    function closeModal(e) {
        e.stopPropagation();
        setShowModal(false);
    }

    const [isHovered, setIsHovered] = useState(false);
    const handleMouseEnter = () => {
        setIsHovered(true);
    };
    const handleMouseLeave = () => {
        setIsHovered(false);
    };

    function goToBookDetails(event) {
        event.preventDefault();
        window.location.href = `./${book.id}`;
    }

    function handleShowModal(e) {
        e.stopPropagation();
        setShowModal(true);
    }

    function handleHideModal(e) {
        e.stopPropagation();
        setShowModal(false);
    }

    return (
        <article>
            <div
                className="book-card"
                onClick={goToBookDetails}
                onMouseEnter={handleMouseEnter}
                onMouseLeave={handleMouseLeave}
            >
                {currentUserList[0] && (
                    <span className=" absolute -top-3 -right-3 bg-lime-300 px-2 py-1 text-sm rounded-xl">
                        {currentUserList[0].status.name}
                    </span>
                )}

                <img
                    className="book-card-img mx-auto"
                    src={book.thumbnail.replace("http:", "https:")}
                    alt={book.title}
                />
                {isHovered && (
                    <p className="img-hover" onClick={handleShowModal}>
                        Apercu rapide
                    </p>
                )}
                <div className="footer-card">
                    <div>
                        {book.kinds.map((tag) => (
                            <span
                                key={tag.id}
                                style={{ backgroundColor: tag.bgColor }}
                                className="rounded-2xl inline-block mx-1 w-2 h-2"
                            ></span>
                        ))}
                    </div>
                    <h3 className="title-card mx-auto">{book.title}</h3>
                    <div className="mx-auto text-center">
                        {note ? (
                            <Rating
                                className="h-[16px] w-[150px] px-4 mt-1"
                                readOnly
                                value={note}
                                itemStyles={rateStyles}
                            />
                        ) : (
                            <span>Pas de note</span>
                        )}
                    </div>
                </div>
            </div>
            {showModal && (
                // la modale ______________________
                <>
                    <div
                        className="fixed inset-0 z-10 bg-slate-800/75"
                        onClick={(e) => closeModal(e)}
                    ></div>
                    <div className="w-4/5 flex md:flex-row flex-col justify-between fixed z-10 top-1/3 left-1/2 -translate-y-1/2 -translate-x-1/2 bg-slate-300 p-10 text-slate-900 rounded">
                        <img
                            className="book-modal-img d-block mx-auto mb-4"
                            src={book.thumbnail.replace("http:", "https:")}
                            alt={book.title}
                        />
                        <div className="w-full md:w-3/4 mx-auto ">
                            <h2 className="text-xl ">{book.title}</h2>
                            <h3>
                                de{" "}
                                {book.authors.map((author, index) => (
                                    <span key={index}>{author.name + " "}</span>
                                ))}
                                ,
                            </h3>
                            <div className="mx-auto  w-[250px] my-3 ">
                                {note ? (
                                    <Rating
                                        className="pt-1 h-[35px]"
                                        readOnly
                                        value={note}
                                        itemStyles={rateStyles}
                                    />
                                ) : (
                                    <span>Pas de note</span>
                                )}
                            </div>
                            <div className="flex flex-wrap  justify-center pt-4">
                                {book.kinds.map((tag, index) => {
                                    return (
                                        <div key={index} className="my-1 ">
                                            <span
                                                style={{
                                                    color: tag.color,
                                                    backgroundColor:
                                                        tag.bgColor,
                                                }}
                                                className="mx-3 md:mx- rounded-2xl px-3 py-1 text-sm mb-2"
                                            >
                                                {tag.name}
                                            </span>
                                        </div>
                                    );
                                })}
                            </div>
                            <p
                                className="my-6 mx-2 sm:mx-6 text-left text-sm font-light"
                                dangerouslySetInnerHTML={{
                                    __html:
                                        book.description.substr(0, 250) +
                                        " ...",
                                }}
                            ></p>
                            <a
                                href={`/book/${book.id}`}
                                className="text-sm btn-primary mt-4 py-1 text-white font-medium bg-orange-400 hover:bg-orange-500"
                            >
                                Voir la fiche détaillée
                            </a>
                            <p className="absolute bottom-2 right-4 text-xs italic">
                                Ajouté le{" "}
                                {dayjs(book.AddedAt).format("DD/MM/YYYY")} par{" "}
                                {book.AddedBy.pseudo}
                            </p>
                        </div>

                        <div
                            onClick={() => setShowModal(false)}
                            className="modal-close-button"
                        >
                            X
                        </div>
                    </div>
                </>
                // fin de la modale _______________
            )}
        </article>
    );
}

export default Book;
