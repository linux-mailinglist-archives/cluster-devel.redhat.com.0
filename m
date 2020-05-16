Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id E37531D61D4
	for <lists+cluster-devel@lfdr.de>; Sat, 16 May 2020 17:12:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1589641928;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=JC53c+1eAkf4n5RUJV9/TAzhG3C7lKqz1HWo1GDwurY=;
	b=JDwLrx1Jn3+rcncQG+udrk6GKby95Go68NJj99D+ti/Pd5BrGhQCNWNZ7xKl0HV7r34SKk
	L1mqaju8w5DqEKY4I2NQ1iwrCIqJ92YhE2HumupBeu1JJsEJKHbg16KfKCA7GaEqJrYLwa
	N5fXOXKFqRMgpr5mZii1nESmFvNgfsk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-281-6sIf8zVHPX2g7pSUE4Y9Tw-1; Sat, 16 May 2020 11:12:07 -0400
X-MC-Unique: 6sIf8zVHPX2g7pSUE4Y9Tw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 834321005512;
	Sat, 16 May 2020 15:12:04 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E21BE60BF3;
	Sat, 16 May 2020 15:12:03 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 042544EA0C;
	Sat, 16 May 2020 15:11:58 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04GFBofX016085 for <cluster-devel@listman.util.phx.redhat.com>;
	Sat, 16 May 2020 11:11:50 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 687F9200A773; Sat, 16 May 2020 15:11:50 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 510B82029F77
	for <cluster-devel@redhat.com>; Sat, 16 May 2020 15:11:47 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 523308007CD
	for <cluster-devel@redhat.com>; Sat, 16 May 2020 15:11:47 +0000 (UTC)
Received: from eu-smtp-delivery-151.mimecast.com
	(eu-smtp-delivery-151.mimecast.com [207.82.80.151]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-268-xtuvLNYrMbS1I7FU9IdXuA-1;
	Sat, 16 May 2020 11:11:44 -0400
X-MC-Unique: xtuvLNYrMbS1I7FU9IdXuA-1
Received: from AcuMS.aculab.com (156.67.243.126 [156.67.243.126]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	uk-mta-182-psAgggZzN62zzCab8iGYhQ-1; Sat, 16 May 2020 16:11:41 +0100
X-MC-Unique: psAgggZzN62zzCab8iGYhQ-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) by
	AcuMS.aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) with Microsoft
	SMTP Server (TLS) id 15.0.1347.2; Sat, 16 May 2020 16:11:40 +0100
Received: from AcuMS.Aculab.com ([fe80::43c:695e:880f:8750]) by
	AcuMS.aculab.com ([fe80::43c:695e:880f:8750%12]) with mapi id
	15.00.1347.000; Sat, 16 May 2020 16:11:40 +0100
From: David Laight <David.Laight@aculab.com>
To: "'David Howells'" <dhowells@redhat.com>, Christoph Hellwig <hch@lst.de>
Thread-Topic: [PATCH 27/33] sctp: export sctp_setsockopt_bindx
Thread-Index: AQHWKsxNyiOODFVfBEqdWGEpseVc56iq0duQ
Date: Sat, 16 May 2020 15:11:40 +0000
Message-ID: <05d946ae948946158dbfcbc07939b799@AcuMS.aculab.com>
References: <20200514062820.GC8564@lst.de>
	<20200513062649.2100053-1-hch@lst.de>
	<20200513062649.2100053-28-hch@lst.de>
	<20200513180058.GB2491@localhost.localdomain>
	<129070.1589556002@warthog.procyon.org.uk>
In-Reply-To: <129070.1589556002@warthog.procyon.org.uk>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 04GFBofX016085
X-loop: cluster-devel@redhat.com
Cc: Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>,
	"linux-nvme@lists.infradead.org" <linux-nvme@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-sctp@vger.kernel.org" <linux-sctp@vger.kernel.org>,
	"target-devel@vger.kernel.org" <target-devel@vger.kernel.org>,
	"linux-afs@lists.infradead.org" <linux-afs@lists.infradead.org>,
	"linux-cifs@vger.kernel.org" <linux-cifs@vger.kernel.org>,
	"rds-devel@oss.oracle.com" <rds-devel@oss.oracle.com>,
	"linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
	"cluster-devel@redhat.com" <cluster-devel@redhat.com>,
	Jakub Kicinski <kuba@kernel.org>,
	"linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
	Alexey Kuznetsov <kuznet@ms2.inr.ac.ru>,
	"drbd-dev@lists.linbit.com" <drbd-dev@tron.linbit.com>,
	"ceph-devel@vger.kernel.org" <ceph-devel@vger.kernel.org>,
	"linux-nfs@vger.kernel.org" <linux-nfs@vger.kernel.org>,
	Neil Horman <nhorman@tuxdriver.com>,
	Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	Vlad Yasevich <vyasevich@gmail.com>, Eric Dumazet <edumazet@google.com>,
	Jon Maloy <jmaloy@redhat.com>, Ying Xue <ying.xue@windriver.com>,
	"David S. Miller" <davem@davemloft.net>,
	"ocfs2-devel@oss.oracle.com" <ocfs2-devel@oss.oracle.com>
Subject: Re: [Cluster-devel] [PATCH 27/33] sctp: export sctp_setsockopt_bindx
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

From: David Howells
> Sent: 15 May 2020 16:20
> Christoph Hellwig <hch@lst.de> wrote:
> 
> > > The advantage on using kernel_setsockopt here is that sctp module will
> > > only be loaded if dlm actually creates a SCTP socket.  With this
> > > change, sctp will be loaded on setups that may not be actually using
> > > it. It's a quite big module and might expose the system.
> >
> > True.  Not that the intent is to kill kernel space callers of setsockopt,
> > as I plan to remove the set_fs address space override used for it.
> 
> For getsockopt, does it make sense to have the core kernel load optval/optlen
> into a buffer before calling the protocol driver?  Then the driver need not
> see the userspace pointer at all.
> 
> Similar could be done for setsockopt - allocate a buffer of the size requested
> by the user inside the kernel and pass it into the driver, then copy the data
> back afterwards.

Yes, it also simplifies all the compat code.
And there is a BPF test in setsockopt that also wants to
pass on a kernel buffer.

I'm willing to sit and write the patch.
Quoting from a post I made later on Friday.

Basically:

This patch sequence (to be written) does the following:

Patch 1: Change __sys_setsockopt() to allocate a kernel buffer,
         copy the data into it then call set_fs(KERNEL_DS).
         An on-stack buffer (say 64 bytes) will be used for
         small transfers.

Patch 2: The same for __sys_getsockopt().

Patch 3: Compat setsockopt.

Patch 4: Compat getsockopt.

Patch 5: Remove the user copies from the global socket options code.

Patches 6 to n-1; Remove the user copies from the per-protocol code.

Patch n: Remove the set_fs(KERNEL_DS) from the entry points.

This should be bisectable.

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)


