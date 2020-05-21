Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 5B1551DC8BA
	for <lists+cluster-devel@lfdr.de>; Thu, 21 May 2020 10:35:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1590050102;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=obZdU9m1f4gBG7IPZBGum67WhYcqVAFCF7+Z+EA4Q4U=;
	b=AHyw0uoH49m9Jl0PMKGBgPLTRuDoMyp/aaRKLjKFVqhVpppz17WPS47BRPptrfl6Jafx+h
	k942S92n79O6lE3/I++qTWJb//enOW6nUsw3fqblmf3vXEarfo7X5NqZXsIDz4PkOZStN7
	C3Z67kbb1bs9GWtCDxvLc0OpzWm8mak=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-67-5cu5oSJ-MuSzWifNOu0DUg-1; Thu, 21 May 2020 04:35:00 -0400
X-MC-Unique: 5cu5oSJ-MuSzWifNOu0DUg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0D893460;
	Thu, 21 May 2020 08:34:58 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8980D5C1B0;
	Thu, 21 May 2020 08:34:57 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4FF2A4EE9D;
	Thu, 21 May 2020 08:34:56 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04L8YqYJ011056 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 21 May 2020 04:34:52 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 0CCC75AB7E; Thu, 21 May 2020 08:34:52 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D6019DBAF6
	for <cluster-devel@redhat.com>; Thu, 21 May 2020 08:34:49 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F175B8ECB14
	for <cluster-devel@redhat.com>; Thu, 21 May 2020 08:34:48 +0000 (UTC)
Received: from verein.lst.de (verein.lst.de [213.95.11.211]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-179-3nVdfx_IMyyo_1AvZzELgQ-1;
	Thu, 21 May 2020 04:34:46 -0400
X-MC-Unique: 3nVdfx_IMyyo_1AvZzELgQ-1
Received: by verein.lst.de (Postfix, from userid 2407)
	id 2946668BEB; Thu, 21 May 2020 10:34:43 +0200 (CEST)
Date: Thu, 21 May 2020 10:34:42 +0200
From: Christoph Hellwig <hch@lst.de>
To: Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>
Message-ID: <20200521083442.GA7771@lst.de>
References: <20200520195509.2215098-1-hch@lst.de>
	<20200520195509.2215098-32-hch@lst.de>
	<20200520231001.GU2491@localhost.localdomain>
	<20200520.162355.2212209708127373208.davem@davemloft.net>
	<20200520233913.GV2491@localhost.localdomain>
MIME-Version: 1.0
In-Reply-To: <20200520233913.GV2491@localhost.localdomain>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: cluster-devel@redhat.com
Cc: edumazet@google.com, linux-nvme@lists.infradead.org,
	linux-sctp@vger.kernel.org, target-devel@vger.kernel.org,
	linux-afs@lists.infradead.org, linux-cifs@vger.kernel.org,
	rds-devel@oss.oracle.com, linux-rdma@vger.kernel.org, hch@lst.de,
	cluster-devel@redhat.com, kuznet@ms2.inr.ac.ru, kuba@kernel.org,
	drbd-dev@tron.linbit.com, ceph-devel@vger.kernel.org,
	linux-nfs@vger.kernel.org, nhorman@tuxdriver.com,
	yoshfuji@linux-ipv6.org, netdev@vger.kernel.org,
	vyasevich@gmail.com, linux-kernel@vger.kernel.org,
	jmaloy@redhat.com, ying.xue@windriver.com,
	David Miller <davem@davemloft.net>, ocfs2-devel@oss.oracle.com
Subject: Re: [Cluster-devel] [PATCH 31/33] sctp: add sctp_sock_set_nodelay
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/cluster-devel>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=subscribe>
Sender: cluster-devel-bounces@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, May 20, 2020 at 08:39:13PM -0300, Marcelo Ricardo Leitner wrote:
> On Wed, May 20, 2020 at 04:23:55PM -0700, David Miller wrote:
> > From: Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>
> > Date: Wed, 20 May 2020 20:10:01 -0300
> > 
> > > The duplication with sctp_setsockopt_nodelay() is quite silly/bad.
> > > Also, why have the 'true' hardcoded? It's what dlm uses, yes, but the
> > > API could be a bit more complete than that.
> > 
> > The APIs are being designed based upon what in-tree users actually
> > make use of.  We can expand things later if necessary.
> 
> Sometimes expanding things later can be though, thus why the worry.
> But ok, I get it. Thanks.
> 
> The comment still applies, though. (re the duplication)

Where do you see duplication?

sctp_setsockopt_nodelay does the following things:

 - verifies optlen, returns -EINVAL if it doesn't match
 - calls get_user, returns -EFAULT on error
 - converts the value from get_user to a boolean and assigns it
   to sctp_sk(sk)->nodelay
 - returns 0.

sctp_sock_set_nodelay does:

 - call lock_sock
 - assign true to sctp_sk(sk)->nodelay
 - call release_sock
 - does not return an error code

