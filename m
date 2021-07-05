Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 8ACCE3BC22C
	for <lists+cluster-devel@lfdr.de>; Mon,  5 Jul 2021 19:17:23 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-573-EjW9pd5BNuegPhKg8Gz-8w-1; Mon, 05 Jul 2021 13:17:21 -0400
X-MC-Unique: EjW9pd5BNuegPhKg8Gz-8w-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 42C55100C610;
	Mon,  5 Jul 2021 17:17:19 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1ED265C1D0;
	Mon,  5 Jul 2021 17:17:17 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4B0F14A712;
	Mon,  5 Jul 2021 17:17:13 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 165HH5Gr009198 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 5 Jul 2021 13:17:07 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 915DF2D47B; Mon,  5 Jul 2021 17:17:05 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8BFC063A51
	for <cluster-devel@redhat.com>; Mon,  5 Jul 2021 17:17:02 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7130318A01A0
	for <cluster-devel@redhat.com>; Mon,  5 Jul 2021 17:17:02 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-569-WOO3Kx2gM4CmzUWRoiMNKg-1; Mon, 05 Jul 2021 13:16:58 -0400
X-MC-Unique: WOO3Kx2gM4CmzUWRoiMNKg-1
Received: from hch by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat
	Linux)) id 1m0Rsn-00ARRr-0c; Mon, 05 Jul 2021 16:55:46 +0000
Date: Mon, 5 Jul 2021 17:55:45 +0100
From: Christoph Hellwig <hch@infradead.org>
To: Andreas Gruenbacher <agruenba@redhat.com>
Message-ID: <YOM5kbDXD7QJGg0k@infradead.org>
References: <20210628172727.1894503-1-agruenba@redhat.com>
	<YNoJPZ4NWiqok/by@casper.infradead.org>
	<YNoLTl602RrckQND@infradead.org>
	<YNpGW2KNMF9f77bk@casper.infradead.org>
	<YNqvzNd+7+YtXfQj@infradead.org>
	<CAHc6FU7+Q0D_pnjUbLXseeHfVQZ2nHTKMzH+0ppLh9cpX-UaPg@mail.gmail.com>
	<CAHc6FU6NWgVGPkvLM_mb+TpK3aM2BK+RrLgKgfS20kCLVV=ECg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAHc6FU6NWgVGPkvLM_mb+TpK3aM2BK+RrLgKgfS20kCLVV=ECg@mail.gmail.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	casper.infradead.org. See http://www.infradead.org/rpr.html
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
Cc: linux-xfs@vger.kernel.org, cluster-devel <cluster-devel@redhat.com>,
	"Darrick J . Wong" <djwong@kernel.org>,
	Matthew Wilcox <willy@infradead.org>,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jul 05, 2021 at 05:51:22PM +0200, Andreas Gruenbacher wrote:
> On Wed, Jun 30, 2021 at 2:29 PM Andreas Gruenbacher <agruenba@redhat.com> wrote:
> > Darrick,
> >
> > will you pick up those two patches and push them to Linus? They both
> > seem pretty safe.
> 
> Hello, is there anybody out there?
> 
> I've put the two patches here with the sign-offs they've received:

Please send out an updated series likey everyone else.

