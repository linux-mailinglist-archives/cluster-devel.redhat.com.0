Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id DF7B044D26F
	for <lists+cluster-devel@lfdr.de>; Thu, 11 Nov 2021 08:25:33 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-3-1-PGCiMhMoeKeVjulLRKbA-1; Thu, 11 Nov 2021 02:25:29 -0500
X-MC-Unique: 1-PGCiMhMoeKeVjulLRKbA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 54877E757;
	Thu, 11 Nov 2021 07:25:27 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D32CB6784F;
	Thu, 11 Nov 2021 07:25:26 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0C4D918199EE;
	Thu, 11 Nov 2021 07:25:21 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
	[10.11.54.2])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1AB7PDFK015891 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 11 Nov 2021 02:25:13 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 16080404727C; Thu, 11 Nov 2021 07:25:13 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 11CBD4047279
	for <cluster-devel@redhat.com>; Thu, 11 Nov 2021 07:25:13 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E035A1066559
	for <cluster-devel@redhat.com>; Thu, 11 Nov 2021 07:25:12 +0000 (UTC)
Received: from verein.lst.de (verein.lst.de [213.95.11.211]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-37-uiH8sDJkMTa95Dagu0ckXw-1;
	Thu, 11 Nov 2021 02:25:09 -0500
X-MC-Unique: uiH8sDJkMTa95Dagu0ckXw-1
Received: by verein.lst.de (Postfix, from userid 2407)
	id 9298167373; Thu, 11 Nov 2021 08:25:06 +0100 (CET)
Date: Thu, 11 Nov 2021 08:25:06 +0100
From: Christoph Hellwig <hch@lst.de>
To: Andreas Gruenbacher <agruenba@redhat.com>
Message-ID: <20211111072506.GB30478@lst.de>
References: <20211110113842.517426-1-agruenba@redhat.com>
	<20211110125527.GA25465@lst.de>
	<CAHc6FU49TnYvrL-FU5oz9th6STuQ=eYokjsD+0QpbkdHedRd9w@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAHc6FU49TnYvrL-FU5oz9th6STuQ=eYokjsD+0QpbkdHedRd9w@mail.gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
X-loop: cluster-devel@redhat.com
Cc: cluster-devel <cluster-devel@redhat.com>,
	"Darrick J . Wong" <djwong@kernel.org>,
	stable <stable@vger.kernel.org>, linux-xfs@vger.kernel.org,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	Christoph Hellwig <hch@lst.de>
Subject: Re: [Cluster-devel] [5.15 REGRESSION] iomap: Fix inline extent
 handling in iomap_readpage
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

On Wed, Nov 10, 2021 at 03:52:01PM +0100, Andreas Gruenbacher wrote:
> Hmm, that doesn't make sense to me: the filesystem doesn't know that
> iomap_readpage will pad to page boundaries. This happens at the iomap
> layer, so the iomap layer should also deal with the consequences.
> We're using different alignment rules here and for direct I/O, so that
> makes fake-aligning the extent size in iomap_begin even more
> questionable.
> 
> "Fixing" the extent size the filesystem returns would also break
> direct I/O. We could add some additional padding code to
> iomap_dio_inline_iter to deal with that, but currently, there's no
> need for that.

The iomap mapping sizes are read-only to iomap for a good reason.  You
can't just break that design.

