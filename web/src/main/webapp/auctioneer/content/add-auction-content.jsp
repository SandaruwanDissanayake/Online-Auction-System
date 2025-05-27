<%--
  Created by IntelliJ IDEA.
  User: sanda
  Date: 5/25/2025
  Time: 1:52 PM
  To change this template use File | Settings | File Templates.
--%>
<div id="add-auction-content" class="max-w-3xl mx-auto bg-gray-dark rounded-xl shadow-lg p-8 mt-4 h-screen">
  <h1 class="text-2xl font-bold text-accent mb-6">Create New Auction</h1>

  <form id="auction-form" action="${pageContext.request.contextPath}/CreateAuctionServlet" method="post" class="space-y-6">
    <div>
      <label for="title" class="block text-sm font-medium mb-1">Auction Title</label>
      <input type="text" id="title" name="title" required
             class="w-full px-4 py-2 rounded bg-primary border border-accent focus:outline-none focus:ring-1 focus:ring-accent">
    </div>

    <div>
      <label for="description" class="block text-sm font-medium mb-1">Description</label>
      <textarea id="description" name="description" rows="4" required
                class="w-full px-4 py-2 rounded bg-primary border border-accent focus:outline-none focus:ring-1 focus:ring-accent"></textarea>
    </div>

    <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
      <div>
        <label for="startingPrice" class="block text-sm font-medium mb-1">Starting Price ($)</label>
        <input type="number" id="startingPrice" name="startingPrice" min="0" step="0.01" required
               class="w-full px-4 py-2 rounded bg-primary border border-accent focus:outline-none focus:ring-1 focus:ring-accent">
      </div>

      <div>
        <label for="endTime" class="block text-sm font-medium mb-1">End Time</label>
        <input type="datetime-local" id="endTime" name="endTime" required
               class="w-full px-4 py-2 rounded bg-primary border border-accent focus:outline-none focus:ring-1 focus:ring-accent">
      </div>
    </div>

    <div class="flex justify-end space-x-4 pt-4">
      <button type="button" onclick="loadContent('dashboard-content.jsp')"
              class="px-6 py-2 border border-accent rounded text-accent hover:bg-accent hover:text-primary transition">
        Cancel
      </button>
      <button type="submit"
              class="px-6 py-2 bg-accent text-primary font-medium rounded hover:bg-opacity-90 transition">
        Create Auction
      </button>
    </div>
  </form>
</div>
