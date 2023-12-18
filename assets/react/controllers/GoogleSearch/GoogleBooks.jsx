import React from "react";
import GoogleBookCard from "./GoogleBookCard";

function GoogleBooks( googleBooks) {
    console.log(googleBooks.googleBooks.items)
  
    return (
    <div className="container mx-auto w-full">
        {
        googleBooks.googleBooks.items && googleBooks.googleBooks.items.map(book => {
            return (
                
                book.accessInfo.embeddable &&
                <GoogleBookCard key={book.id} book={book} className="m-5 p-4"  />
                
            )})
        }
    </div>
  )
}
export default GoogleBooks