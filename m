Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 1765F1DCEA7
	for <lists+cluster-devel@lfdr.de>; Thu, 21 May 2020 15:55:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1590069303;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=4AWH1AUEd7Au/qvsJAY3f3OpE4viRwDzW+yF47F593Y=;
	b=HS099H0d+81Vp/8KuW0zPPqTnp6SF+dNFXPc1LMHN/9XXqIoyIrNVIhpPlTGWS6gzkpwZu
	ZVeZeeNl6RlkgnAAaN4XdRigYk+nHSYuhcZYYHsBNV5iQUM1zBSZXV4pd1/1q9Od2+ZrX9
	KTLIb3XYJcmklOfa9GL/uwGvjQXOSk8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-429-nZm9s-RkM2C02zKu0Gu2-Q-1; Thu, 21 May 2020 09:55:01 -0400
X-MC-Unique: nZm9s-RkM2C02zKu0Gu2-Q-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BCB82461;
	Thu, 21 May 2020 13:54:58 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EB269106222E;
	Thu, 21 May 2020 13:54:57 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2CD2E1809543;
	Thu, 21 May 2020 13:54:57 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04LDsqkE001968 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 21 May 2020 09:54:52 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id AE6D22166BA0; Thu, 21 May 2020 13:54:52 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AAA132157F23
	for <cluster-devel@redhat.com>; Thu, 21 May 2020 13:54:50 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 391098ECB46
	for <cluster-devel@redhat.com>; Thu, 21 May 2020 13:54:50 +0000 (UTC)
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
	[209.85.160.196]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-511-IyIhn3tkOEih9VuaxpEe1w-1; Thu, 21 May 2020 09:54:47 -0400
X-MC-Unique: IyIhn3tkOEih9VuaxpEe1w-1
Received: by mail-qt1-f196.google.com with SMTP id i68so5510111qtb.5;
	Thu, 21 May 2020 06:54:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to;
	bh=4AWH1AUEd7Au/qvsJAY3f3OpE4viRwDzW+yF47F593Y=;
	b=iy1sTvE5ZXJWk2WMXMPOV3KVIDQ4UbKNya9f/EzjOYbQOumyyBuaSLk8rZESWkUxlS
	BRGHJMg+6kefosfa+qDQsp7pDzVr/etJfpwc1htdb8dxILctiXA21gZWxzsixBFDZzbN
	GuOzVQzNUKMQys3jpY2znY1djP5IZJK/Wfg//U2WXZqCnnttLk+V4J0FFZT/XVAnxAKk
	yXSC+cYmjQ002AlQm9vbCfeRbfxkJTrL46BlZ56vcq8CJMJyGw1gwVRJ46XXgDU6QlbX
	yzWXwRQsPoU7oH2UrY3t3WRRZenQXMdmdpsBKCh1NOQ2pzZvs9GAqiOdRToZHVPzRq2W
	PSAg==
X-Gm-Message-State: AOAM5311wiVKtDlJ74MjuqxGLsrC+AMhk9aVq6LA0JZy0uhbEfvzHJE7
	tVMO6vuPNkCTT55sLzMXGIo=
X-Google-Smtp-Source: ABdhPJwr1XLsFhpL67QfydZyYFncpQXNqgVtdQK2lUSy7K4tdF1oTZiVeuf1ITYdnePhr53SYWBElg==
X-Received: by 2002:ac8:4c8b:: with SMTP id j11mr10385232qtv.58.1590069286825; 
	Thu, 21 May 2020 06:54:46 -0700 (PDT)
Received: from localhost.localdomain ([168.181.48.225])
	by smtp.gmail.com with ESMTPSA id
	n85sm1682417qkn.31.2020.05.21.06.54.45
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 21 May 2020 06:54:46 -0700 (PDT)
Received: by localhost.localdomain (Postfix, from userid 1000)
	id 7AEDAC0BEB; Thu, 21 May 2020 10:54:43 -0300 (-03)
Date: Thu, 21 May 2020 10:54:43 -0300
From: Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <20200521135443.GY2491@localhost.localdomain>
References: <20200520195509.2215098-1-hch@lst.de>
	<20200520195509.2215098-33-hch@lst.de>
	<20200520230025.GT2491@localhost.localdomain>
	<20200521084224.GA7859@lst.de>
MIME-Version: 1.0
In-Reply-To: <20200521084224.GA7859@lst.de>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: cluster-devel@redhat.com
Cc: Eric Dumazet <edumazet@google.com>, linux-nvme@lists.infradead.org,
	linux-sctp@vger.kernel.org, target-devel@vger.kernel.org,
	linux-afs@lists.infradead.org, linux-cifs@vger.kernel.org,
	rds-devel@oss.oracle.com, linux-rdma@vger.kernel.org,
	cluster-devel@redhat.com, Alexey Kuznetsov <kuznet@ms2.inr.ac.ru>,
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, May 21, 2020 at 10:42:24AM +0200, Christoph Hellwig wrote:
> On Wed, May 20, 2020 at 08:00:25PM -0300, Marcelo Ricardo Leitner wrote:
> > > +	if (err)
> > > +		return err;
> > > +
> > > +	lock_sock(sk);
> > > +	err = sctp_do_bind(sk, (union sctp_addr *)addr, af->sockaddr_len);
> > > +	if (!err)
> > > +		err = sctp_send_asconf_add_ip(sk, addr, 1);
> > 
> > Some problems here.
> > - addr may contain a list of addresses
> > - the addresses, then, are not being validated
> > - sctp_do_bind may fail, on which it requires some undoing
> >   (like sctp_bindx_add does)
> > - code duplication with sctp_setsockopt_bindx.
> 
> sctp_do_bind and thus this function only support a single address, as
> that is the only thing that the DLM code requires.  I could move the

I see.

> user copy out of sctp_setsockopt_bindx and reuse that, but it is a
> rather rcane API.

Yes. With David's patch, which is doing that, it can be as simple as:

static int sctp_bind_add(struct sock *sk, struct sockaddr *addr,
               int addrlen)
{
	int ret;
	lock_sock(sk);
	ret = sctp_setsockopt_bindx(sk, addr, addrlen, SCTP_BINDX_ADD_ADDR);
	release_sock(sk);
	return ret;
}

and then dlm would be using code that we can test through sctp-only tests as
well.

> 
> > 
> > This patch will conflict with David's one,
> > [PATCH net-next] sctp: Pull the user copies out of the individual sockopt functions.
> 
> Do you have a link?  A quick google search just finds your mail that
> I'm replying to.

https://lore.kernel.org/netdev/fd94b5e41a7c4edc8f743c56a04ed2c9%40AcuMS.aculab.com/T/

> 
> > (I'll finish reviewing it in the sequence)
> > 
> > AFAICT, this patch could reuse/build on his work in there. The goal is
> > pretty much the same and would avoid the issues above.
> > 
> > This patch could, then, point the new bind_add proto op to the updated
> > sctp_setsockopt_bindx almost directly.
> > 
> > Question then is: dlm never removes an addr from the bind list. Do we
> > want to add ops for both? Or one that handles both operations?
> > Anyhow, having the add operation but not the del seems very weird to
> > me.
> 
> We generally only add operations for things that we actually use.
> bind_del is another logical op, but we can trivially add that when we
> need it.

Right, okay.

