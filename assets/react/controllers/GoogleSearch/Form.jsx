import React, { useRef, useState } from "react";
import GoogleBooks from "./GoogleBooks";

export default function Form() {
    const search = useRef();
    const [googleBooks, setGoogleBooks] = useState([]);
    const handleSubmit = async (e) => {
        e.preventDefault();
        setGoogleBooks(await googleSearch());
    };

    const googleSearch = async () => {
        const url = `https://www.googleapis.com/books/v1/volumes?q=${search.current.value}&maxResults=30&embeddable=true`;
        console.log(url)
        const reponse = await fetch(url);
        const result = await reponse.json();
        return result;
    };


    return (
        <>
            <form
                onSubmit={(e) => handleSubmit(e)}
                className="max-w-md my-5 text-center mx-auto"
            >
                <input
                    ref={search}
                    className="rounded border-2 border-slate-500 bg-slate-50 py-1.5 pl-4 text-gray-900 placeholder:text-gray-400  sm:text-sm sm:leading-6"
                    type="text"
                    name="search"
                    id="search"
                    autoComplete="search"
                    placeholder="Rechercher un livre"
                />
                <button className=" ms-4 rounded px-2 py-1  bg-zinc-200 hover:bg-zinc-300  mt-5 mx-auto">
                    Recherche
                </button>
            </form>
            <GoogleBooks googleBooks={googleBooks} />
        </>
    );
}
