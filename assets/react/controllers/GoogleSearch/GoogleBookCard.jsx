import React from "react";

function GoogleBookCard({ book }) {
    
    const toggleResume = (e) => {
        
        const resume = document.getElementById(`resume_${book.id}`)
        let resumeText = book.volumeInfo.description
            ? book.volumeInfo.description
            : "Pas de resumé"
        if(e.target.innerHTML==='Afficher +'){
            e.target.innerHTML = "Afficher -"
            resume.innerText = resumeText 
        }else {
            e.target.innerHTML = "Afficher +"
            resume.innerText = resumeText.substr(0,350) + " ..." 
        }
    }

    //remplace http par https pour les images de couverture
    const linkUpdate= (link) => {
        return link.replace("http:","https:")
        //console.log("newlink:" link)
    }

    const handleAddBook = () => {
        console.log(book.id)
    }

    return (
        <>
        <hr className="mb-3 border-slate-900" />
        <div className="w-full flex flex-col sm:flex-row">
            <div className="flex flex-col sm:w-1/3 w-full p-5  justify-start items-center pt-5">
                <img
                    className="max-w-sm mx-auto mb-3 block rounded-t lg:rounded-t-none lg:rounded-l object-cover"
                    src={
                        book.volumeInfo.imageLinks
                            ? linkUpdate(book.volumeInfo.imageLinks.thumbnail)
                            : "images/Image_non_disponible_portrait_small.png"
                    }
                    alt={`couverture de  ${book.volumeInfo.title}`}
                />
                <a 
                    href={`/book/add/${book.id}`}
                    onClick={handleAddBook}
                    className="text-sm btn-primary max-w-48 mx-auto mb-2">
                    Ajouter à la bibliothèque
                </a>
                <a 
                className="btn-indigo text-sm max-w-48 mx-auto text-center"
                href={book.volumeInfo.infoLink} 
                target="_blank"
                >voir dans Google</a>
                
            </div>
            <div className="w-full sm:w-2/3 m-5 p-4 flex flex-col justify-between ">
                <div className="mb-8 ">
                    <h1 className="title-google text-center sm:text-start">{book.volumeInfo.title}</h1>
                        <h2 className="author text-center sm:text-start">
                            {book.volumeInfo.authors
                                ? book.volumeInfo.authors[0]
                                : "non precisé"}
                        </h2>
                        <p className="text-gray-600">Publication : {
                        book.volumeInfo.publishedDate ? 
                        book.volumeInfo.publishedDate.substr(0,4) : 'Non précisé'}, nombre de pages : {book.volumeInfo.pageCount}</p>
  
                    <p id={`resume_${book.id}`} className="text-gray-700 resume mt-5 ">
                        {book.volumeInfo.description
                            ? book.volumeInfo.description.substr(0,350) + " ..."
                            : "Pas de resumé"}
                    
                    </p>
                    <button className="btn-plus-moins"  onClick={e=>toggleResume(e)}>Afficher +</button>
                    
                </div>

            </div>
        </div>
        </>
    );
}
export default GoogleBookCard;
