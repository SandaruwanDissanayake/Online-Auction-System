<%--
  Auction Creation Form with Image Picker
  Maintains original color scheme:
    - primary: #111111
    - gray-dark: #2F2F2F
    - light: #F6F6F6
    - accent: #FFCB74
--%>
<div id="add-auction-content" class="max-w-4xl mx-auto bg-gray-dark rounded-xl shadow-lg p-8 mt-4">
  <h1 class="text-3xl font-bold text-accent mb-8 border-b border-accent/30 pb-4">Create New Auction</h1>

  <form id="auction-form" action="${pageContext.request.contextPath}/CreateAuctionServlet"
        method="post" enctype="multipart/form-data" class="space-y-8">

    <!-- Image Upload & Preview Section -->
    <div class="flex flex-col md:flex-row gap-8">
      <!-- Image Preview -->
      <div class="w-full md:w-1/3">
        <div class="border-2 border-dashed border-accent/30 rounded-lg p-4 h-64 flex items-center justify-center">
          <img id="image-preview" src="#" alt="Auction Item Preview"
               class="hidden max-h-full max-w-full object-contain">
          <div id="no-image" class="text-center text-light/70">
            <i class="fas fa-image text-4xl mb-2"></i>
            <p>No image selected</p>
          </div>
        </div>
        <input type="file" id="itemImage" name="itemImage" accept="image/*"
               class="hidden" onchange="previewImage(this)">
        <button type="button" onclick="document.getElementById('itemImage').click()"
                class="mt-4 w-full bg-accent/10 hover:bg-accent/20 text-accent py-2 px-4 rounded-lg border border-accent/30 transition">
          <i class="fas fa-upload mr-2"></i> Choose Image
        </button>
      </div>

      <!-- Form Fields -->
      <div class="w-full md:w-2/3 space-y-6">
        <div>
          <label for="title" class="block text-sm font-medium text-light mb-2">Auction Title</label>
          <input type="text" id="title" name="title" required
                 class="w-full px-4 py-3 rounded-lg bg-primary border border-accent/30 focus:outline-none focus:ring-2 focus:ring-accent text-light">
        </div>

        <div>
          <label for="description" class="block text-sm font-medium text-light mb-2">Description</label>
          <textarea id="description" name="description" rows="4" required
                    class="w-full px-4 py-3 rounded-lg bg-primary border border-accent/30 focus:outline-none focus:ring-2 focus:ring-accent text-light"></textarea>
        </div>

        <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
          <div>
            <label for="startingPrice" class="block text-sm font-medium text-light mb-2">Starting Price ($)</label>
            <div class="relative">
              <span class="absolute inset-y-0 left-0 flex items-center pl-3 text-light/70">$</span>
              <input type="number" id="startingPrice" name="startingPrice" min="0" step="0.01" required
                     class="w-full pl-8 pr-4 py-3 rounded-lg bg-primary border border-accent/30 focus:outline-none focus:ring-2 focus:ring-accent text-light">
            </div>
          </div>

          <div>
            <label for="endTime" class="block text-sm font-medium text-light mb-2">End Time</label>
            <input type="datetime-local" id="endTime" name="endTime" required
                   class="w-full px-4 py-3 rounded-lg bg-primary border border-accent/30 focus:outline-none focus:ring-2 focus:ring-accent text-light">
          </div>
        </div>
      </div>
    </div>

    <!-- Form Actions -->
    <div class="flex justify-end space-x-4 pt-6 border-t border-accent/10">
      <button type="button" onclick="loadContent('dashboard-content.jsp')"
              class="px-6 py-3 border border-accent rounded-lg text-accent hover:bg-accent/10 transition font-medium">
        Cancel
      </button>
      <button type="submit"
              class="px-8 py-3 bg-accent text-primary font-bold rounded-lg hover:bg-accent/90 transition flex items-center">
        <i class="fas fa-gavel mr-2"></i> Create Auction
      </button>
    </div>
  </form>
</div>

