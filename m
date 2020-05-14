Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id DC1341D2A11
	for <lists+cluster-devel@lfdr.de>; Thu, 14 May 2020 10:29:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1589444992;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=1xQp3cuyC/9APZ04CYxELXio/IhFRC6clxItS7iGAPM=;
	b=Aw4+e8KJimmxV/OHs5sZIoEiAuzx3SPbQzVq6Y8stN7CU0NR/xG1j65APDd+6LBQhH8Ajs
	xfuLWyQ4Rn3mkH1KIhj32rD2nMhPj/oJ58FPVz7+LNJzrGo2CYAiKP49RI2rbnNvqeBC6z
	d1kXeJHhVdYow3VNbQWxFyAiwi49Wnc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-405-_Vy-KO-iMbavanY2lk3fTQ-1; Thu, 14 May 2020 04:29:50 -0400
X-MC-Unique: _Vy-KO-iMbavanY2lk3fTQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 76EB5835B4F;
	Thu, 14 May 2020 08:29:48 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 48136619A7;
	Thu, 14 May 2020 08:29:48 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 820331809547;
	Thu, 14 May 2020 08:29:47 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04E8TeEp004716 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 14 May 2020 04:29:41 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id A0FFB14192F; Thu, 14 May 2020 08:29:40 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 86ECA141931
	for <cluster-devel@redhat.com>; Thu, 14 May 2020 08:29:38 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C1CFB185A78B
	for <cluster-devel@redhat.com>; Thu, 14 May 2020 08:29:37 +0000 (UTC)
Received: from eu-smtp-delivery-151.mimecast.com
	(eu-smtp-delivery-151.mimecast.com [185.58.86.151]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-308-UTnLDQMfMoOjZg4oUIExOg-1;
	Thu, 14 May 2020 04:29:35 -0400
X-MC-Unique: UTnLDQMfMoOjZg4oUIExOg-1
Received: from AcuMS.aculab.com (156.67.243.126 [156.67.243.126]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	uk-mta-41-3XJ_vbSSOB-Mdnc0632Mfw-1; Thu, 14 May 2020 09:29:32 +0100
X-MC-Unique: 3XJ_vbSSOB-Mdnc0632Mfw-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) by
	AcuMS.aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) with Microsoft
	SMTP Server (TLS) id 15.0.1347.2; Thu, 14 May 2020 09:29:31 +0100
Received: from AcuMS.Aculab.com ([fe80::43c:695e:880f:8750]) by
	AcuMS.aculab.com ([fe80::43c:695e:880f:8750%12]) with mapi id
	15.00.1347.000; Thu, 14 May 2020 09:29:31 +0100
From: David Laight <David.Laight@aculab.com>
To: "'Joe Perches'" <joe@perches.com>, Christoph Hellwig <hch@lst.de>,
	"David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>
Thread-Topic: remove kernel_setsockopt and kernel_getsockopt
Thread-Index: AQHWKU15LJmP4mOGDE2/GHhLszFt9KinP7aQ
Date: Thu, 14 May 2020 08:29:30 +0000
Message-ID: <756758e8f0e34e2e97db470609f5fbba@AcuMS.aculab.com>
References: <20200513062649.2100053-1-hch@lst.de>
	<ecc165c33962d964d518c80de605af632eee0474.camel@perches.com>
In-Reply-To: <ecc165c33962d964d518c80de605af632eee0474.camel@perches.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 04E8TeEp004716
X-loop: cluster-devel@redhat.com
Cc: Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>,
	Eric Dumazet <edumazet@google.com>,
	"linux-nvme@lists.infradead.org" <linux-nvme@lists.infradead.org>,
	"linux-sctp@vger.kernel.org" <linux-sctp@vger.kernel.org>,
	"target-devel@vger.kernel.org" <target-devel@vger.kernel.org>,
	"linux-afs@lists.infradead.org" <linux-afs@lists.infradead.org>,
	"linux-cifs@vger.kernel.org" <linux-cifs@vger.kernel.org>,
	"rds-devel@oss.oracle.com" <rds-devel@oss.oracle.com>,
	"linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
	"cluster-devel@redhat.com" <cluster-devel@redhat.com>,
	Alexey Kuznetsov <kuznet@ms2.inr.ac.ru>,
	"linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
	"drbd-dev@lists.linbit.com" <drbd-dev@tron.linbit.com>,
	"ceph-devel@vger.kernel.org" <ceph-devel@vger.kernel.org>,
	"linux-nfs@vger.kernel.org" <linux-nfs@vger.kernel.org>,
	Neil Horman <nhorman@tuxdriver.com>,
	Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>, Vlad
	Yasevich <vyasevich@gmail.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Jon Maloy <jmaloy@redhat.com>, Ying Xue <ying.xue@windriver.com>,
	"ocfs2-devel@oss.oracle.com" <ocfs2-devel@oss.oracle.com>
Subject: Re: [Cluster-devel] remove kernel_setsockopt and kernel_getsockopt
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Joe Perches
> Sent: 13 May 2020 18:39
> On Wed, 2020-05-13 at 08:26 +0200, Christoph Hellwig wrote:
> > this series removes the kernel_setsockopt and kernel_getsockopt
> > functions, and instead switches their users to small functions that
> > implement setting (or in one case getting) a sockopt directly using
> > a normal kernel function call with type safety and all the other
> > benefits of not having a function call.
> >
> > In some cases these functions seem pretty heavy handed as they do
> > a lock_sock even for just setting a single variable, but this mirrors
> > the real setsockopt implementation - counter to that a few kernel
> > drivers just set the fields directly already.
> >
> > Nevertheless the diffstat looks quite promising:
> >
> >  42 files changed, 721 insertions(+), 799 deletions(-)

I missed this patch going through.
Massive NACK.

You need to export functions that do most of the socket options
for all protocols.
As well as REUSADDR and NODELAY SCTP has loads because a lot
of stuff that should have been extra system calls got piled
into setsockopt.

An alternate solution would be to move the copy_to/from_user()
into a wrapper function so that the kernel_[sg]etsockopt()
functions would bypass them completely.

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)


