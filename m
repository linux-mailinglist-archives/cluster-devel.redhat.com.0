Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 36FBE70DD93
	for <lists+cluster-devel@lfdr.de>; Tue, 23 May 2023 15:37:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1684849049;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=Kw4TxwgeOi/rgp7Fv4+clTuRK+8n6ArCGyls+zA2GjQ=;
	b=CdFobR4jbUHAwo4CDJvDBcxNHVG/9WknTzZd276jDq5wnms9jDVXLM4rUYiEK0UJZbwvmv
	/QYphAyHLe0cHdZm9Zf4elrtVOj6oP9ptMozaYQVVCeptuBSLKg2LmLHCfZHC4HTh4EPe5
	ZyI3iTJEMT0zuyVOVWIs4d3OMpYSz30=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-338-rCss0u80P4asKMPk4onWNA-1; Tue, 23 May 2023 09:37:26 -0400
X-MC-Unique: rCss0u80P4asKMPk4onWNA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 573691C03DB0;
	Tue, 23 May 2023 13:37:22 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 30663140E95D;
	Tue, 23 May 2023 13:37:22 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id C916219465B3;
	Tue, 23 May 2023 13:37:21 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 62CDE19465A0 for <cluster-devel@listman.corp.redhat.com>;
 Tue, 23 May 2023 13:37:20 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 40E1740CFD03; Tue, 23 May 2023 13:37:20 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 393ED40CFD01
 for <cluster-devel@redhat.com>; Tue, 23 May 2023 13:37:20 +0000 (UTC)
Received: from us-smtp-inbound-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1E4EC8028B1
 for <cluster-devel@redhat.com>; Tue, 23 May 2023 13:37:20 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-510-KRy-fqv7N96uHzPsjkqFlg-1; Tue,
 23 May 2023 09:37:18 -0400
X-MC-Unique: KRy-fqv7N96uHzPsjkqFlg-1
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1q1SCQ-00AG4x-QM; Tue, 23 May 2023 13:37:14 +0000
Date: Tue, 23 May 2023 14:37:14 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Andreas Gruenbacher <agruenba@redhat.com>
Message-ID: <ZGzBikVAWeXOmGQd@casper.infradead.org>
References: <20230517032442.1135379-1-willy@infradead.org>
 <20230517032442.1135379-6-willy@infradead.org>
 <CAHc6FU6GowpTfX-MgRiqqwZZJ0r-85C9exc2pNkBkySCGUT0FA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAHc6FU6GowpTfX-MgRiqqwZZJ0r-85C9exc2pNkBkySCGUT0FA@mail.gmail.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Subject: Re: [Cluster-devel] [PATCH 5/6] gfs2: Support ludicrously large
 folios in gfs2_trans_add_databufs()
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
Cc: Hannes Reinecke <hare@suse.com>, cluster-devel@redhat.com,
 Luis Chamberlain <mcgrof@kernel.org>, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: infradead.org
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, May 23, 2023 at 02:46:07PM +0200, Andreas Gruenbacher wrote:
> >  void gfs2_trans_add_databufs(struct gfs2_inode *ip, struct folio *folio,
> > -                            unsigned int from, unsigned int len)
> > +                            size_t from, size_t len)
> >  {
> >         struct buffer_head *head = folio_buffers(folio);
> >         unsigned int bsize = head->b_size;
> 
> This only makes sense if the to, start, and end variables in
> gfs2_trans_add_databufs() are changed from unsigned int to size_t as
> well.

The history of this patch is that I started doing conversions from page
-> folio in gfs2, then you came out with a very similar series.  This
patch is the remainder after rebasing my patches on yours.  So we can
either drop this patch or just apply it.  I wasn't making a concerted
effort to make gfs2 support 4GB+ sized folios, it's just part of the
conversion that I do.

> >  extern void gfs2_trans_add_databufs(struct gfs2_inode *ip, struct folio *folio,
> > -                                   unsigned int from, unsigned int len);
> > +                                   size_t from, size_t len);

