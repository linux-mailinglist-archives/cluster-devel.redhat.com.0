Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 4E5181D3143
	for <lists+cluster-devel@lfdr.de>; Thu, 14 May 2020 15:28:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1589462890;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=LgPhuPKfZXf545/NFOWeec+9irfexL9OC6P3IyLSeg4=;
	b=dsOdtyzWpmS9hgJJINnvWpa8kYdU6DsptbJuXOj0pFSNOZcwbfL9tqsQTwU4dRmRf01LHV
	wldwh9fLHiQnPXpj9Xcv3728+rDi0yRkzMEylUOgaZ3W40AmrsyVTFvUxvsap3YPl0Vaaq
	/Nlm/l+TJTnl2zd7hBmXXrEAGODC6dc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-220-KxIscEkXPseLa2i7O6L4ZA-1; Thu, 14 May 2020 09:28:07 -0400
X-MC-Unique: KxIscEkXPseLa2i7O6L4ZA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 66DC5107ACF2;
	Thu, 14 May 2020 13:28:04 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B1AD76AD05;
	Thu, 14 May 2020 13:28:03 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5F0B14E987;
	Thu, 14 May 2020 13:28:02 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04EDRu45000869 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 14 May 2020 09:27:56 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 582C1109D3AB; Thu, 14 May 2020 13:27:56 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 33A62109D3A6
	for <cluster-devel@redhat.com>; Thu, 14 May 2020 13:27:54 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CFAFF18F0248
	for <cluster-devel@redhat.com>; Thu, 14 May 2020 13:27:53 +0000 (UTC)
Received: from eu-smtp-delivery-151.mimecast.com
	(eu-smtp-delivery-151.mimecast.com [146.101.78.151]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-392-QaO7E3gSNzKU18GDB0ox5A-1;
	Thu, 14 May 2020 09:27:51 -0400
X-MC-Unique: QaO7E3gSNzKU18GDB0ox5A-1
Received: from AcuMS.aculab.com (156.67.243.126 [156.67.243.126]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	uk-mta-113-XOFJDQnwOvSfGd4XKFaC9g-1; Thu, 14 May 2020 14:27:47 +0100
X-MC-Unique: XOFJDQnwOvSfGd4XKFaC9g-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) by
	AcuMS.aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) with Microsoft
	SMTP Server (TLS) id 15.0.1347.2; Thu, 14 May 2020 14:27:46 +0100
Received: from AcuMS.Aculab.com ([fe80::43c:695e:880f:8750]) by
	AcuMS.aculab.com ([fe80::43c:695e:880f:8750%12]) with mapi id
	15.00.1347.000; Thu, 14 May 2020 14:27:46 +0100
From: David Laight <David.Laight@aculab.com>
To: "'Marcelo Ricardo Leitner'" <marcelo.leitner@gmail.com>,
	"'Christoph Hellwig'" <hch@lst.de>
Thread-Topic: [PATCH 32/33] sctp: add sctp_sock_get_primary_addr
Thread-Index: AQHWKVDpRRlTTX4YZEat3HB6AYvqqainVRxwgAAtMyCAABBE4A==
Date: Thu, 14 May 2020 13:27:46 +0000
Message-ID: <aff8f5ec8d6d44dbace63825af197086@AcuMS.aculab.com>
References: <20200513062649.2100053-1-hch@lst.de>
	<20200513062649.2100053-33-hch@lst.de>
	<20200513180302.GC2491@localhost.localdomain>
	<d112e18bfbdd40dfb219ed2c1f2082d4@AcuMS.aculab.com>
	<c66e0309572345f5b0f32d078701f2d7@AcuMS.aculab.com>
In-Reply-To: <c66e0309572345f5b0f32d078701f2d7@AcuMS.aculab.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 04EDRu45000869
X-loop: cluster-devel@redhat.com
Cc: 'Eric Dumazet' <edumazet@google.com>,
	"'linux-nvme@lists.infradead.org'" <linux-nvme@lists.infradead.org>,
	"'linux-sctp@vger.kernel.org'" <linux-sctp@vger.kernel.org>,
	"'target-devel@vger.kernel.org'" <target-devel@vger.kernel.org>,
	"'linux-afs@lists.infradead.org'" <linux-afs@lists.infradead.org>,
	"'linux-cifs@vger.kernel.org'" <linux-cifs@vger.kernel.org>,
	"'rds-devel@oss.oracle.com'" <rds-devel@oss.oracle.com>,
	"'linux-rdma@vger.kernel.org'" <linux-rdma@vger.kernel.org>,
	"'cluster-devel@redhat.com'" <cluster-devel@redhat.com>,
	'Alexey Kuznetsov' <kuznet@ms2.inr.ac.ru>,
	"'linux-block@vger.kernel.org'" <linux-block@vger.kernel.org>,
	'Jakub Kicinski' <kuba@kernel.org>,
	"'drbd-dev@lists.linbit.com'" <drbd-dev@tron.linbit.com>,
	"'ceph-devel@vger.kernel.org'" <ceph-devel@vger.kernel.org>,
	"'linux-nfs@vger.kernel.org'" <linux-nfs@vger.kernel.org>,
	'Neil Horman' <nhorman@tuxdriver.com>,
	'Hideaki YOSHIFUJI' <yoshfuji@linux-ipv6.org>,
	"'netdev@vger.kernel.org'" <netdev@vger.kernel.org>, 'Vlad
	Yasevich' <vyasevich@gmail.com>,
	"'linux-kernel@vger.kernel.org'" <linux-kernel@vger.kernel.org>,
	'Jon Maloy' <jmaloy@redhat.com>, 'Ying Xue' <ying.xue@windriver.com>,
	"'David S. Miller'" <davem@davemloft.net>,
	"'ocfs2-devel@oss.oracle.com'" <ocfs2-devel@oss.oracle.com>
Subject: Re: [Cluster-devel] [PATCH 32/33] sctp: add
	sctp_sock_get_primary_addr
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: David Laight
> Sent: 14 May 2020 13:30
> Subject: RE: [PATCH 32/33] sctp: add sctp_sock_get_primary_addr
> 
> From: David Laight
> > Sent: 14 May 2020 10:51
> > From: Marcelo Ricardo Leitner
> > > Sent: 13 May 2020 19:03
> > >
> > > On Wed, May 13, 2020 at 08:26:47AM +0200, Christoph Hellwig wrote:
> > > > Add a helper to directly get the SCTP_PRIMARY_ADDR sockopt from kernel
> > > > space without going through a fake uaccess.
> > >
> > > Same comment as on the other dlm/sctp patch.
> >
> > Wouldn't it be best to write sctp_[gs]etsockotp() that
> > use a kernel buffer and then implement the user-space
> > calls using a wrapper that does the copies to an on-stack
> > (or malloced if big) buffer.
> 
> Actually looking at __sys_setsockopt() it calls
> BPF_CGROUP_RUN_PROG_SETSOCKOPT() which (by the look of it)
> can copy the user buffer into malloc()ed memory and
> cause set_fs(KERNEL_DS) be called.
> 
> The only way to get rid of that set_fs() is to always
> have the buffer in kernel memory when the underlying
> setsockopt() code is called.

And having started to try coding __sys_setsockopt()
and then found the compat code I suspect that would
be a whole lot more sane if the buffer was in kernel
and it knew that at least (say) 64 bytes were allocated.

The whole compat_alloc_user_space() 'crap' could probably go.

Actually it looks like an application can avoid whatever
checks BPF_CGROUP_RUN_PROG_SETSOCKOPT() is trying to do
by using the 32bit compat ioctls.

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)


