Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id E28A7545329
	for <lists+cluster-devel@lfdr.de>; Thu,  9 Jun 2022 19:40:54 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-631-C4baVu6MP3uG5Jfmc6UGyA-1; Thu, 09 Jun 2022 13:40:49 -0400
X-MC-Unique: C4baVu6MP3uG5Jfmc6UGyA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 965901C05EAE;
	Thu,  9 Jun 2022 17:40:48 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5A21741136E0;
	Thu,  9 Jun 2022 17:40:47 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id D899D1947066;
	Thu,  9 Jun 2022 17:40:46 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 467CD1947040 for <cluster-devel@listman.corp.redhat.com>;
 Thu,  9 Jun 2022 17:40:46 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 2E40818EA4; Thu,  9 Jun 2022 17:40:46 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2A1741730C
 for <cluster-devel@redhat.com>; Thu,  9 Jun 2022 17:40:46 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0F5F4803B22
 for <cluster-devel@redhat.com>; Thu,  9 Jun 2022 17:40:46 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-582-1GDwvpY3M66-p9oslPGWxw-1; Thu, 09 Jun 2022 13:40:43 -0400
X-MC-Unique: 1GDwvpY3M66-p9oslPGWxw-1
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1nzM8y-00DjCy-V3; Thu, 09 Jun 2022 17:40:28 +0000
Date: Thu, 9 Jun 2022 18:40:28 +0100
From: Matthew Wilcox <willy@infradead.org>
To: dsterba@suse.cz, linux-fsdevel@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
 linux-aio@kvack.org, linux-btrfs@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 cluster-devel@redhat.com, linux-mm@kvack.org,
 linux-xfs@vger.kernel.org, linux-nfs@vger.kernel.org,
 linux-ntfs-dev@lists.sourceforge.net, ocfs2-devel@oss.oracle.com,
 linux-mtd@lists.infradead.org, virtualization@lists.linux-foundation.org,
 Christoph Hellwig <hch@lst.de>
Message-ID: <YqIwjEO1a0Sbxbym@casper.infradead.org>
References: <20220608150249.3033815-1-willy@infradead.org>
 <20220608150249.3033815-13-willy@infradead.org>
 <20220609163323.GV20633@twin.jikos.cz>
MIME-Version: 1.0
In-Reply-To: <20220609163323.GV20633@twin.jikos.cz>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Subject: Re: [Cluster-devel] [PATCH v2 12/19] btrfs: Convert
 btrfs_migratepage to migrate_folio
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/cluster-devel>, 
 <mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/cluster-devel/>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/cluster-devel>,
 <mailto:cluster-devel-request@redhat.com?subject=subscribe>
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jun 09, 2022 at 06:33:23PM +0200, David Sterba wrote:
> On Wed, Jun 08, 2022 at 04:02:42PM +0100, Matthew Wilcox (Oracle) wrote:
> > Use filemap_migrate_folio() to do the bulk of the work, and then copy
> > the ordered flag across if needed.
> > 
> > Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
> > Reviewed-by: Christoph Hellwig <hch@lst.de>
> 
> Acked-by: David Sterba <dsterba@suse.com>
> 
> > +static int btrfs_migrate_folio(struct address_space *mapping,
> > +			     struct folio *dst, struct folio *src,
> >  			     enum migrate_mode mode)
> >  {
> > -	int ret;
> > +	int ret = filemap_migrate_folio(mapping, dst, src, mode);
> >  
> > -	ret = migrate_page_move_mapping(mapping, newpage, page, 0);
> >  	if (ret != MIGRATEPAGE_SUCCESS)
> >  		return ret;
> >  
> > -	if (page_has_private(page))
> > -		attach_page_private(newpage, detach_page_private(page));
> 
> If I'm reading it correctly, the private pointer does not need to be set
> like that anymore because it's done somewhere during the
> filemap_migrate_folio() call.

That's correct.  Everything except moving the ordered flag across is
done for you, and I'm kind of tempted to modify folio_migrate_flags()
to copy the ordered flag across as well.  Then you could just use
filemap_migrate_folio() directly.

> > -
> > -	if (PageOrdered(page)) {
> > -		ClearPageOrdered(page);
> > -		SetPageOrdered(newpage);
> > +	if (folio_test_ordered(src)) {
> > +		folio_clear_ordered(src);
> > +		folio_set_ordered(dst);
> >  	}

