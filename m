Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 2787A3B6802
	for <lists+cluster-devel@lfdr.de>; Mon, 28 Jun 2021 19:57:48 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-50-0Ndze7bWNYCOp_eXiJpcow-1; Mon, 28 Jun 2021 13:57:45 -0400
X-MC-Unique: 0Ndze7bWNYCOp_eXiJpcow-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B8A82804142;
	Mon, 28 Jun 2021 17:57:42 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A4E35179B3;
	Mon, 28 Jun 2021 17:57:42 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 825FC4EA2A;
	Mon, 28 Jun 2021 17:57:42 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 15SHveL8019761 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 28 Jun 2021 13:57:40 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id A5FF36E1D8; Mon, 28 Jun 2021 17:57:40 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A19FB6E1DD
	for <cluster-devel@redhat.com>; Mon, 28 Jun 2021 17:57:37 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CE23B800B36
	for <cluster-devel@redhat.com>; Mon, 28 Jun 2021 17:57:37 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-430-Wgn3BH3CPyOZhvp-d8Aj2w-1; Mon, 28 Jun 2021 13:57:35 -0400
X-MC-Unique: Wgn3BH3CPyOZhvp-d8Aj2w-1
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
	Hat Linux)) id 1lxvDx-003IPs-Gk; Mon, 28 Jun 2021 17:39:20 +0000
Date: Mon, 28 Jun 2021 18:39:09 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Andreas Gruenbacher <agruenba@redhat.com>
Message-ID: <YNoJPZ4NWiqok/by@casper.infradead.org>
References: <20210628172727.1894503-1-agruenba@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210628172727.1894503-1-agruenba@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: cluster-devel@redhat.com
Cc: "Darrick J . Wong" <djwong@kernel.org>, linux-fsdevel@vger.kernel.org,
	linux-xfs@vger.kernel.org, cluster-devel@redhat.com
Subject: Re: [Cluster-devel] [PATCH 0/2] iomap: small block problems
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/cluster-devel>, 
	<mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/cluster-devel>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=subscribe>
Sender: cluster-devel-bounces@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jun 28, 2021 at 07:27:25PM +0200, Andreas Gruenbacher wrote:
> (1) In iomap_readpage_actor, an iomap_page is attached to the page even
> for inline inodes.  This is unnecessary because inline inodes don't need
> iomap_page objects.  That alone wouldn't cause any real issues, but when
> iomap_read_inline_data copies the inline data into the page, it sets the
> PageUptodate flag without setting iop->uptodate, causing an
> inconsistency between the two.  This will trigger a WARN_ON in
> iomap_page_release.  The fix should be not to allocate iomap_page
> objects when reading from inline inodes (patch 1).

I don't have a problem with this patch.

> (2) When un-inlining an inode, we must allocate a page with an attached
> iomap_page object (iomap_page_create) and initialize the iop->uptodate
> bitmap (iomap_set_range_uptodate).  We can't currently do that because
> iomap_page_create and iomap_set_range_uptodate are not exported.  That
> could be fixed by exporting those functions, or by implementing an
> additional helper as in patch 2.  Which of the two would you prefer?

Not hugely happy with either of these options, tbh.  I'd rather we apply
a patch akin to this one (plucked from the folio tree), so won't apply:

@@ -1305,7 +1311,7 @@ iomap_writepage_map(struct iomap_writepage_ctx *wpc,
                struct writeback_control *wbc, struct inode *inode,
                struct folio *folio, loff_t end_pos)
 {
-       struct iomap_page *iop = to_iomap_page(folio);
+       struct iomap_page *iop = iomap_page_create(inode, folio);
        struct iomap_ioend *ioend, *next;
        unsigned len = i_blocksize(inode);
        unsigned nblocks = i_blocks_per_folio(inode, folio);
@@ -1313,7 +1319,6 @@ iomap_writepage_map(struct iomap_writepage_ctx *wpc,
        int error = 0, count = 0, i;
        LIST_HEAD(submit_list);

-       WARN_ON_ONCE(nblocks > 1 && !iop);
        WARN_ON_ONCE(iop && atomic_read(&iop->write_bytes_pending) != 0);

        /*

so permit pages without an iop to enter writeback and create an iop
*then*.  Would that solve your problem?

> (3) We're not yet using iomap_page_mkwrite, so iomap_page objects don't
> get created on .page_mkwrite, either.  Part of the reason is that
> iomap_page_mkwrite locks the page and then calls into the filesystem for
> uninlining and for allocating backing blocks.  This conflicts with the
> gfs2 locking order: on gfs2, transactions must be started before locking
> any pages.  We can fix that by calling iomap_page_create from
> gfs2_page_mkwrite, or by doing the uninlining and allocations before
> calling iomap_page_mkwrite.  I've implemented option 2 for now; see
> here:

I think this might also solve this problem?

