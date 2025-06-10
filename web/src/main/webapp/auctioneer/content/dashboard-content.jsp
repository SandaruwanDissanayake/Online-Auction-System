<%--
  Created by IntelliJ IDEA.
  User: sanda
  Date: 5/25/2025
  Time: 1:51 PM
  To change this template use File | Settings | File Templates.
--%>

<div id="dashboard-content">
    <!-- Stats Cards -->
    <div class="grid grid-cols-1 md:grid-cols-4 gap-6 mb-8">
        <div class="glass-panel rounded-xl p-6 hover-glow transition">
            <div class="flex justify-between items-start">
                <div>
                    <p class="text-light/70">Active Auctions</p>
                    <p class="text-3xl font-bold mt-1">12</p>
                </div>
                <div class="bg-accent/10 p-3 rounded-lg text-accent">
                    <i class="fas fa-gavel text-xl"></i>
                </div>
            </div>
            <div class="mt-4 pt-4 border-t border-light/10 text-sm text-success">
                <i class="fas fa-arrow-up mr-1"></i> 3 new today
            </div>
        </div>

        <div class="glass-panel rounded-xl p-6 hover-glow transition">
            <div class="flex justify-between items-start">
                <div>
                    <p class="text-light/70">Total Bids</p>
                    <p class="text-3xl font-bold mt-1">247</p>
                </div>
                <div class="bg-success/10 p-3 rounded-lg text-success">
                    <i class="fas fa-hand-holding-usd text-xl"></i>
                </div>
            </div>
            <div class="mt-4 pt-4 border-t border-light/10 text-sm text-success">
                <i class="fas fa-arrow-up mr-1"></i> 42 today
            </div>
        </div>

        <div class="glass-panel rounded-xl p-6 hover-glow transition">
            <div class="flex justify-between items-start">
                <div>
                    <p class="text-light/70">Revenue</p>
                    <p class="text-3xl font-bold mt-1">$184,750</p>
                </div>
                <div class="bg-warning/10 p-3 rounded-lg text-warning">
                    <i class="fas fa-coins text-xl"></i>
                </div>
            </div>
            <div class="mt-4 pt-4 border-t border-light/10 text-sm text-success">
                <i class="fas fa-arrow-up mr-1"></i> 12% this week
            </div>
        </div>

        <div class="glass-panel rounded-xl p-6 hover-glow transition">
            <div class="flex justify-between items-start">
                <div>
                    <p class="text-light/70">Registered Bidders</p>
                    <p class="text-3xl font-bold mt-1">1,248</p>
                </div>
                <div class="bg-blue-400/10 p-3 rounded-lg text-blue-400">
                    <i class="fas fa-users text-xl"></i>
                </div>
            </div>
            <div class="mt-4 pt-4 border-t border-light/10 text-sm text-success">
                <i class="fas fa-arrow-up mr-1"></i> 28 new today
            </div>
        </div>
    </div>

    <!-- Active Auctions Table -->
    <section class="mb-8">
        <div class="flex justify-between items-center mb-4">
            <h2 class="text-xl font-bold">
                <i class="fas fa-gavel text-accent mr-2"></i> Active Auctions
            </h2>
            <button class="bg-accent hover:bg-accent/90 text-primary px-4 py-2 rounded-lg flex items-center">
                <i class="fas fa-plus mr-2"></i> New Auction
            </button>
        </div>

        <div class="glass-panel rounded-xl overflow-hidden">
            <table class="min-w-full divide-y divide-light/10">
                <thead class="bg-secondary">
                <tr>
                    <th class="px-6 py-3 text-left text-xs font-medium text-light/50 uppercase tracking-wider">Item</th>
                    <th class="px-6 py-3 text-left text-xs font-medium text-light/50 uppercase tracking-wider">Time Left</th>
                    <th class="px-6 py-3 text-left text-xs font-medium text-light/50 uppercase tracking-wider">Current Bid</th>
                    <th class="px-6 py-3 text-left text-xs font-medium text-light/50 uppercase tracking-wider">Bids</th>
                    <th class="px-6 py-3 text-left text-xs font-medium text-light/50 uppercase tracking-wider">Status</th>
                    <th class="px-6 py-3 text-right text-xs font-medium text-light/50 uppercase tracking-wider">Actions</th>
                </tr>
                </thead>
                <tbody class="divide-y divide-light/10">
                <!-- Auction 1 -->
                <tr class="hover:bg-secondary/50 transition">
                    <td class="px-6 py-4 whitespace-nowrap">
                        <div class="flex items-center">
                            <div class="flex-shrink-0 h-10 w-10">
                                <img class="h-10 w-10 rounded-md object-cover" src="https://images.unsplash.com/photo-1616486338812-3dadae4b4ace?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1632&q=80" alt="">
                            </div>
                            <div class="ml-4">
                                <div class="text-sm font-medium">Vintage Rolex Watch</div>
                                <div class="text-xs text-light/50">Lot #VR-1965-42</div>
                            </div>
                        </div>
                    </td>
                    <td class="px-6 py-4 whitespace-nowrap">
                        <div class="text-sm countdown-timer" data-end="2025-06-15T14:30:00">2d 4h 32m</div>
                        <div class="w-full bg-light/20 rounded-full h-1 mt-1">
                            <div class="bg-accent h-full rounded-full" style="width: 65%"></div>
                        </div>
                    </td>
                    <td class="px-6 py-4 whitespace-nowrap text-sm font-bold text-accent">
                        $12,450
                    </td>
                    <td class="px-6 py-4 whitespace-nowrap text-sm">
                        24
                    </td>
                    <td class="px-6 py-4 whitespace-nowrap">
                                    <span class="px-2 inline-flex text-xs leading-5 font-semibold rounded-full bg-success/10 text-success">
                                        Active
                                    </span>
                    </td>
                    <td class="px-6 py-4 whitespace-nowrap text-right text-sm font-medium">
                        <div class="flex justify-end space-x-2">
                            <button class="text-accent hover:text-accent/80 p-1">
                                <i class="fas fa-edit"></i>
                            </button>
                            <button class="text-light/70 hover:text-danger p-1">
                                <i class="fas fa-trash-alt"></i>
                            </button>
                        </div>
                    </td>
                </tr>

                <!-- Auction 2 -->
                <tr class="hover:bg-secondary/50 transition">
                    <td class="px-6 py-4 whitespace-nowrap">
                        <div class="flex items-center">
                            <div class="flex-shrink-0 h-10 w-10">
                                <img class="h-10 w-10 rounded-md object-cover" src="https://images.unsplash.com/photo-1579783902614-a3fb3927b6a5?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1705&q=80" alt="">
                            </div>
                            <div class="ml-4">
                                <div class="text-sm font-medium">Abstract Oil Painting</div>
                                <div class="text-xs text-light/50">Lot #AP-2023-15</div>
                            </div>
                        </div>
                    </td>
                    <td class="px-6 py-4 whitespace-nowrap">
                        <div class="text-sm countdown-timer" data-end="2025-06-14T18:00:00">1d 8h 15m</div>
                        <div class="w-full bg-light/20 rounded-full h-1 mt-1">
                            <div class="bg-accent h-full rounded-full" style="width: 45%"></div>
                        </div>
                    </td>
                    <td class="px-6 py-4 whitespace-nowrap text-sm font-bold text-accent">
                        $8,200
                    </td>
                    <td class="px-6 py-4 whitespace-nowrap text-sm">
                        18
                    </td>
                    <td class="px-6 py-4 whitespace-nowrap">
                                    <span class="px-2 inline-flex text-xs leading-5 font-semibold rounded-full bg-success/10 text-success">
                                        Active
                                    </span>
                    </td>
                    <td class="px-6 py-4 whitespace-nowrap text-right text-sm font-medium">
                        <div class="flex justify-end space-x-2">
                            <button class="text-accent hover:text-accent/80 p-1">
                                <i class="fas fa-edit"></i>
                            </button>
                            <button class="text-light/70 hover:text-danger p-1">
                                <i class="fas fa-trash-alt"></i>
                            </button>
                        </div>
                    </td>
                </tr>

                <!-- Auction 3 -->
                <tr class="hover:bg-secondary/50 transition">
                    <td class="px-6 py-4 whitespace-nowrap">
                        <div class="flex items-center">
                            <div class="flex-shrink-0 h-10 w-10">
                                <img class="h-10 w-10 rounded-md object-cover" src="https://images.unsplash.com/photo-1599643478518-a784e5dc4c8f?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1587&q=80" alt="">
                            </div>
                            <div class="ml-4">
                                <div class="text-sm font-medium">Ming Dynasty Vase</div>
                                <div class="text-xs text-light/50">Lot #MD-16C-87</div>
                            </div>
                        </div>
                    </td>
                    <td class="px-6 py-4 whitespace-nowrap">
                        <div class="text-sm countdown-timer" data-end="2025-06-17T12:00:00">3d 6h 42m</div>
                        <div class="w-full bg-light/20 rounded-full h-1 mt-1">
                            <div class="bg-accent h-full rounded-full" style="width: 25%"></div>
                        </div>
                    </td>
                    <td class="px-6 py-4 whitespace-nowrap text-sm font-bold text-accent">
                        $45,000
                    </td>
                    <td class="px-6 py-4 whitespace-nowrap text-sm">
                        7
                    </td>
                    <td class="px-6 py-4 whitespace-nowrap">
                                    <span class="px-2 inline-flex text-xs leading-5 font-semibold rounded-full bg-warning/10 text-warning">
                                        Reserve Not Met
                                    </span>
                    </td>
                    <td class="px-6 py-4 whitespace-nowrap text-right text-sm font-medium">
                        <div class="flex justify-end space-x-2">
                            <button class="text-accent hover:text-accent/80 p-1">
                                <i class="fas fa-edit"></i>
                            </button>
                            <button class="text-light/70 hover:text-danger p-1">
                                <i class="fas fa-trash-alt"></i>
                            </button>
                        </div>
                    </td>
                </tr>
                </tbody>
            </table>
        </div>
    </section>

    <!-- Recent Activity & Quick Actions -->
    <div class="grid grid-cols-1 lg:grid-cols-3 gap-6">
        <!-- Recent Bids -->
        <section class="lg:col-span-2">
            <h2 class="text-xl font-bold mb-4">
                <i class="fas fa-history text-accent mr-2"></i> Recent Bids
            </h2>
            <div class="glass-panel rounded-xl overflow-hidden">
                <table class="min-w-full divide-y divide-light/10">
                    <thead class="bg-secondary">
                    <tr>
                        <th class="px-6 py-3 text-left text-xs font-medium text-light/50 uppercase tracking-wider">Item</th>
                        <th class="px-6 py-3 text-left text-xs font-medium text-light/50 uppercase tracking-wider">Bidder</th>
                        <th class="px-6 py-3 text-left text-xs font-medium text-light/50 uppercase tracking-wider">Amount</th>
                        <th class="px-6 py-3 text-left text-xs font-medium text-light/50 uppercase tracking-wider">Time</th>
                    </tr>
                    </thead>
                    <tbody class="divide-y divide-light/10">
                    <!-- Bid 1 -->
                    <tr class="hover:bg-secondary/50 transition">
                        <td class="px-6 py-4 whitespace-nowrap text-sm">
                            Vintage Rolex Watch
                        </td>
                        <td class="px-6 py-4 whitespace-nowrap">
                            <div class="flex items-center">
                                <div class="flex-shrink-0 h-8 w-8 rounded-full bg-accent/10 flex items-center justify-center">
                                    <i class="fas fa-user text-accent text-sm"></i>
                                </div>
                                <div class="ml-3">
                                    <div class="text-sm">john.doe@example.com</div>
                                </div>
                            </div>
                        </td>
                        <td class="px-6 py-4 whitespace-nowrap text-sm font-bold text-accent">
                            $12,450
                        </td>
                        <td class="px-6 py-4 whitespace-nowrap text-sm text-light/70">
                            12 minutes ago
                        </td>
                    </tr>
                    <!-- Bid 2 -->
                    <tr class="hover:bg-secondary/50 transition">
                        <td class="px-6 py-4 whitespace-nowrap text-sm">
                            Abstract Oil Painting
                        </td>
                        <td class="px-6 py-4 whitespace-nowrap">
                            <div class="flex items-center">
                                <div class="flex-shrink-0 h-8 w-8 rounded-full bg-accent/10 flex items-center justify-center">
                                    <i class="fas fa-user text-accent text-sm"></i>
                                </div>
                                <div class="ml-3">
                                    <div class="text-sm">sarah.smith@example.com</div>
                                </div>
                            </div>
                        </td>
                        <td class="px-6 py-4 whitespace-nowrap text-sm font-bold text-accent">
                            $8,200
                        </td>
                        <td class="px-6 py-4 whitespace-nowrap text-sm text-light/70">
                            34 minutes ago
                        </td>
                    </tr>
                    <!-- Bid 3 -->
                    <tr class="hover:bg-secondary/50 transition">
                        <td class="px-6 py-4 whitespace-nowrap text-sm">
                            Ming Dynasty Vase
                        </td>
                        <td class="px-6 py-4 whitespace-nowrap">
                            <div class="flex items-center">
                                <div class="flex-shrink-0 h-8 w-8 rounded-full bg-accent/10 flex items-center justify-center">
                                    <i class="fas fa-user text-accent text-sm"></i>
                                </div>
                                <div class="ml-3">
                                    <div class="text-sm">michael.j@example.com</div>
                                </div>
                            </div>
                        </td>
                        <td class="px-6 py-4 whitespace-nowrap text-sm font-bold text-accent">
                            $45,000
                        </td>
                        <td class="px-6 py-4 whitespace-nowrap text-sm text-light/70">
                            2 hours ago
                        </td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </section>

        <!-- Quick Actions -->
        <section>
            <h2 class="text-xl font-bold mb-4">
                <i class="fas fa-bolt text-accent mr-2"></i> Quick Actions
            </h2>
            <div class="glass-panel rounded-xl p-6 space-y-4">
                <button class="w-full bg-accent hover:bg-accent/90 text-primary font-bold py-3 px-4 rounded-lg flex items-center justify-center">
                    <i class="fas fa-plus-circle mr-2"></i> Create New Auction
                </button>
                <button class="w-full bg-secondary hover:bg-secondary/80 border border-accent/30 text-accent font-bold py-3 px-4 rounded-lg flex items-center justify-center">
                    <i class="fas fa-user-plus mr-2"></i> Invite Bidders
                </button>
                <button class="w-full bg-secondary hover:bg-secondary/80 border border-accent/30 text-accent font-bold py-3 px-4 rounded-lg flex items-center justify-center">
                    <i class="fas fa-file-export mr-2"></i> Export Reports
                </button>
            </div>

            <!-- Ending Soon -->
            <h2 class="text-xl font-bold mt-8 mb-4">
                <i class="fas fa-clock text-accent mr-2"></i> Ending Soon
            </h2>
            <div class="glass-panel rounded-xl p-6 space-y-4">
                <div class="flex items-center justify-between">
                    <div>
                        <h4 class="font-medium">Rolex Watch</h4>
                        <div class="text-xs text-light/70 countdown-timer" data-end="2025-06-15T14:30:00">2h 45m</div>
                    </div>
                    <button class="text-accent hover:text-accent/80">
                        <i class="fas fa-arrow-right"></i>
                    </button>
                </div>
                <div class="flex items-center justify-between">
                    <div>
                        <h4 class="font-medium">Abstract Painting</h4>
                        <div class="text-xs text-light/70 countdown-timer" data-end="2025-06-14T18:00:00">1d 4h</div>
                    </div>
                    <button class="text-accent hover:text-accent/80">
                        <i class="fas fa-arrow-right"></i>
                    </button>
                </div>
            </div>
        </section>
    </div>
</div>
