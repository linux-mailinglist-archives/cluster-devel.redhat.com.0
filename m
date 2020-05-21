Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 0B85C1DC8E5
	for <lists+cluster-devel@lfdr.de>; Thu, 21 May 2020 10:42:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1590050564;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=mNsRD8+k/jgRp6o5+w4N1Z/p9Shp3mBBQHRxzUX3wJI=;
	b=G/81zI/56M2L99dJ+HZjYogYK1U5nITjJeKw0IDWyqzq+eYey1Tei6TnHAzGQWjYN7DTm9
	ECsDsIznQzsBSe0ai0vbGi2O50tFNK/ehX86w8R2AGp3MwYYHOW0cyzfyEcxQCnpiMks8K
	tupAR6Gak3AKVmVvc0zpaa0cpD1n55g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-379-4MJIH4nXPkqIjkLS2jkbjA-1; Thu, 21 May 2020 04:42:42 -0400
X-MC-Unique: 4MJIH4nXPkqIjkLS2jkbjA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A9EA5EC1A1;
	Thu, 21 May 2020 08:42:39 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 57CAA5C1B0;
	Thu, 21 May 2020 08:42:39 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 52C514EEA0;
	Thu, 21 May 2020 08:42:38 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04L8gZLZ011654 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 21 May 2020 04:42:35 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 8895F200BCE6; Thu, 21 May 2020 08:42:35 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 83565202683E
	for <cluster-devel@redhat.com>; Thu, 21 May 2020 08:42:33 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7E172800FFA
	for <cluster-devel@redhat.com>; Thu, 21 May 2020 08:42:33 +0000 (UTC)
Received: from verein.lst.de (verein.lst.de [213.95.11.211]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-368-jsz0LRnLPmKZQD2xdXofBQ-1;
	Thu, 21 May 2020 04:42:28 -0400
X-MC-Unique: jsz0LRnLPmKZQD2xdXofBQ-1
Received: by verein.lst.de (Postfix, from userid 2407)
	id 1D9C368BEB; Thu, 21 May 2020 10:42:25 +0200 (CEST)
Date: Thu, 21 May 2020 10:42:24 +0200
From: Christoph Hellwig <hch@lst.de>
To: Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>
Message-ID: <20200521084224.GA7859@lst.de>
References: <20200520195509.2215098-1-hch@lst.de>
	<20200520195509.2215098-33-hch@lst.de>
	<20200520230025.GT2491@localhost.localdomain>
MIME-Version: 1.0
In-Reply-To: <20200520230025.GT2491@localhost.localdomain>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: cluster-devel@redhat.com
Cc: Eric Dumazet <edumazet@google.com>, linux-nvme@lists.infradead.org,
	linux-sctp@vger.kernel.org, target-devel@vger.kernel.org,
	linux-afs@lists.infradead.org, linux-cifs@vger.kernel.org,
	rds-devel@oss.oracle.com, linux-rdma@vger.kernel.org,
	Christoph Hellwig <hch@lst.de>, cluster-devel@redhat.com,
	Alexey Kuznetsov <kuznet@ms2.inr.ac.ru>,
	Jakub Kicinski <kuba@kernel.org>, drbd-dev@tron.linbit.com,
	ceph-devel@vger.kernel.org, linux-nfs@vger.kernel.org,
	Neil Horman <nhorman@tuxdriver.com>,
	Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>,
	netdev@vger.kernel.org, Vlad Yasevich <vyasevich@gmail.com>,
	linux-kernel@vger.kernel.org, Jon Maloy <jmaloy@redhat.com>,
	Ying Xue <ying.xue@windriver.com>, "David S. Miller" <davem@davemloft.net>,
	ocfs2-devel@oss.oracle.com
Subject: Re: [Cluster-devel] [PATCH 32/33] net: add a new bind_add method
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

On Wed, May 20, 2020 at 08:00:25PM -0300, Marcelo Ricardo Leitner wrote:
> > +	if (err)
> > +		return err;
> > +
> > +	lock_sock(sk);
> > +	err = sctp_do_bind(sk, (union sctp_addr *)addr, af->sockaddr_len);
> > +	if (!err)
> > +		err = sctp_send_asconf_add_ip(sk, addr, 1);
> 
> Some problems here.
> - addr may contain a list of addresses
> - the addresses, then, are not being validated
> - sctp_do_bind may fail, on which it requires some undoing
>   (like sctp_bindx_add does)
> - code duplication with sctp_setsockopt_bindx.

sctp_do_bind and thus this function only support a single address, as
that is the only thing that the DLM code requires.  I could move the
user copy out of sctp_setsockopt_bindx and reuse that, but it is a
rather rcane API.

> 
> This patch will conflict with David's one,
> [PATCH net-next] sctp: Pull the user copies out of the individual sockopt functions.

Do you have a link?  A quick google search just finds your mail that
I'm replying to.

> (I'll finish reviewing it in the sequence)
> 
> AFAICT, this patch could reuse/build on his work in there. The goal is
> pretty much the same and would avoid the issues above.
> 
> This patch could, then, point the new bind_add proto op to the updated
> sctp_setsockopt_bindx almost directly.
> 
> Question then is: dlm never removes an addr from the bind list. Do we
> want to add ops for both? Or one that handles both operations?
> Anyhow, having the add operation but not the del seems very weird to
> me.

We generally only add operations for things that we actually use.
bind_del is another logical op, but we can trivially add that when we
need it.

