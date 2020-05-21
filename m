Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 21B261DCB45
	for <lists+cluster-devel@lfdr.de>; Thu, 21 May 2020 12:47:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1590058021;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=0smEpFhhu8Fh4O3FEZ+OQPxQweEqbWIYoRc384WKT0A=;
	b=Vvk6a0CnuVVL3lo7bqcCfoMCLzhWCoeZFMvVxqO9evlNhTemlIhi4YEB4fOV/TrCbDlOh6
	cDQMs7/tY08p3+uT3iVH5kUe5LSzf9HMRuNHIPqeBVt4RpG44IbguYALugK84OA8OlGSOX
	aaGZU3WkNg2HNeQ2aUBcL6x5fbKu6DI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-16-nVejs4EeMYSmQEo_dN2qVw-1; Thu, 21 May 2020 06:46:58 -0400
X-MC-Unique: nVejs4EeMYSmQEo_dN2qVw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 977148015D1;
	Thu, 21 May 2020 10:46:55 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EB31F60C05;
	Thu, 21 May 2020 10:46:54 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7907E1809543;
	Thu, 21 May 2020 10:46:52 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04LAkkLr018498 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 21 May 2020 06:46:46 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 8FB00DBB11; Thu, 21 May 2020 10:46:46 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8A3A1DBAEC
	for <cluster-devel@redhat.com>; Thu, 21 May 2020 10:46:40 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E0318803AC0
	for <cluster-devel@redhat.com>; Thu, 21 May 2020 10:46:39 +0000 (UTC)
Received: from eu-smtp-delivery-151.mimecast.com
	(eu-smtp-delivery-151.mimecast.com [146.101.78.151]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-55-ptEgPvZaN1eoiwaMpnu1fQ-1;
	Thu, 21 May 2020 06:46:37 -0400
X-MC-Unique: ptEgPvZaN1eoiwaMpnu1fQ-1
Received: from AcuMS.aculab.com (156.67.243.126 [156.67.243.126]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	uk-mta-221-qFd0NAKZNGeARFK-F-oKaQ-1; Thu, 21 May 2020 11:46:34 +0100
X-MC-Unique: qFd0NAKZNGeARFK-F-oKaQ-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) by
	AcuMS.aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) with Microsoft
	SMTP Server (TLS) id 15.0.1347.2; Thu, 21 May 2020 11:46:33 +0100
Received: from AcuMS.Aculab.com ([fe80::43c:695e:880f:8750]) by
	AcuMS.aculab.com ([fe80::43c:695e:880f:8750%12]) with mapi id
	15.00.1347.000; Thu, 21 May 2020 11:46:33 +0100
From: David Laight <David.Laight@aculab.com>
To: "'Christoph Hellwig'" <hch@lst.de>
Thread-Topic: remove kernel_setsockopt and kernel_getsockopt v2
Thread-Index: AQHWL0EWFDRlmpM/90uRt9jvD36P/KiyKtMAgAAFoACAACnvQA==
Date: Thu, 21 May 2020 10:46:33 +0000
Message-ID: <b7c7cf98999f4167b821f4425896e4e8@AcuMS.aculab.com>
References: <20200520195509.2215098-1-hch@lst.de>
	<138a17dfff244c089b95f129e4ea2f66@AcuMS.aculab.com>
	<20200521091150.GA8401@lst.de>
In-Reply-To: <20200521091150.GA8401@lst.de>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 04LAkkLr018498
X-loop: cluster-devel@redhat.com
Cc: Marcelo Ricardo
	Leitner <marcelo.leitner@gmail.com>, Eric Dumazet <edumazet@google.com>,
	"linux-nvme@lists.infradead.org" <linux-nvme@lists.infradead.org>,
	"linux-sctp@vger.kernel.org" <linux-sctp@vger.kernel.org>,
	"target-devel@vger.kernel.org" <target-devel@vger.kernel.org>,
	"linux-afs@lists.infradead.org" <linux-afs@lists.infradead.org>,
	"linux-cifs@vger.kernel.org" <linux-cifs@vger.kernel.org>,
	"rds-devel@oss.oracle.com" <rds-devel@oss.oracle.com>,
	"linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
	"cluster-devel@redhat.com" <cluster-devel@redhat.com>,
	Alexey Kuznetsov <kuznet@ms2.inr.ac.ru>, Jakub Kicinski <kuba@kernel.org>,
	"drbd-dev@lists.linbit.com" <drbd-dev@tron.linbit.com>,
	"ceph-devel@vger.kernel.org" <ceph-devel@vger.kernel.org>,
	"linux-nfs@vger.kernel.org" <linux-nfs@vger.kernel.org>,
	Neil Horman <nhorman@tuxdriver.com>,
	Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	Vlad Yasevich <vyasevich@gmail.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Jon Maloy <jmaloy@redhat.com>, Ying Xue <ying.xue@windriver.com>,
	"David S. Miller" <davem@davemloft.net>,
	"ocfs2-devel@oss.oracle.com" <ocfs2-devel@oss.oracle.com>
Subject: Re: [Cluster-devel] remove kernel_setsockopt and kernel_getsockopt
	v2
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

From: 'Christoph Hellwig'
> Sent: 21 May 2020 10:12
...
> > I worried about whether getsockopt() should read the entire
> > user buffer first. SCTP needs the some of it often (including a
> > sockaddr_storage in one case), TCP needs it once.
> > However the cost of reading a few words is small, and a big
> > buffer probably needs setting to avoid leaking kernel
> > memory if the structure has holes or fields that don't get set.
> > Reading from userspace solves both issues.
> 
> As mention in the thread on the last series:  That was my first idea, but
> we have way to many sockopts, especially in obscure protocols that just
> hard code the size.  The chance of breaking userspace in a way that can't
> be fixed without going back to passing user pointers to get/setsockopt
> is way to high to commit to such a change unfortunately.

Right the syscall stubs probably can't do it.
But the per-protocol ones can for the main protocols.

I posted a patch for SCTP yesterday that removes 800 lines
of source and 8k of object code.
Even that needs a horrid bodge for one request where the
length returned has to be less than the data copied!

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)


