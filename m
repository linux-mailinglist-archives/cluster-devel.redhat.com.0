Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id BBB921E7D2A
	for <lists+cluster-devel@lfdr.de>; Fri, 29 May 2020 14:27:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1590755261;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=6Abb1sDf4KaC9lcbqcn+VYqoP6WoJ1a9mT/xwngMPR0=;
	b=Vw3468tEbycuPGeWeFv/HNE3AnO9+/vSa+yOmcan8LwbpvjjGvXwSNcuYnnhFSAuxIISqC
	QfraGLy5+mZtSm08X8d0w5tiXJB+Jvk8RyZopETTfL0qIDtHjIkBs04tzFBnWE40T0SKNw
	ehW5HUql0J+dG6Qh2z4DIDB1SSvf0UE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-160-EPn3NFCNPtaQ6LYGHU0Opw-1; Fri, 29 May 2020 08:27:39 -0400
X-MC-Unique: EPn3NFCNPtaQ6LYGHU0Opw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0BD0118A8226;
	Fri, 29 May 2020 12:27:37 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 32C862B6F8;
	Fri, 29 May 2020 12:27:35 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id CE1D71809543;
	Fri, 29 May 2020 12:27:29 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04TCRLIb008649 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 29 May 2020 08:27:22 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id CCA65101B55F; Fri, 29 May 2020 12:27:21 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BCA48101F0AB
	for <cluster-devel@redhat.com>; Fri, 29 May 2020 12:27:19 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 64F6A8007DC
	for <cluster-devel@redhat.com>; Fri, 29 May 2020 12:27:18 +0000 (UTC)
Received: from eu-smtp-delivery-151.mimecast.com
	(eu-smtp-delivery-151.mimecast.com [207.82.80.151]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-255-2JYMMHXhMuiEAebHBDVnYg-1;
	Fri, 29 May 2020 08:27:15 -0400
X-MC-Unique: 2JYMMHXhMuiEAebHBDVnYg-1
Received: from AcuMS.aculab.com (156.67.243.126 [156.67.243.126]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	uk-mta-170-42ymZSVqMyi6D1OdQieiPQ-1; Fri, 29 May 2020 13:27:13 +0100
X-MC-Unique: 42ymZSVqMyi6D1OdQieiPQ-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) by
	AcuMS.aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) with Microsoft
	SMTP Server (TLS) id 15.0.1347.2; Fri, 29 May 2020 13:27:12 +0100
Received: from AcuMS.Aculab.com ([fe80::43c:695e:880f:8750]) by
	AcuMS.aculab.com ([fe80::43c:695e:880f:8750%12]) with mapi id
	15.00.1347.000; Fri, 29 May 2020 13:27:12 +0100
From: David Laight <David.Laight@aculab.com>
To: "'Christoph Hellwig'" <hch@lst.de>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>, Vlad Yasevich <vyasevich@gmail.com>, 
	"Neil Horman" <nhorman@tuxdriver.com>, Marcelo Ricardo Leitner
	<marcelo.leitner@gmail.com>
Thread-Topic: [PATCH 4/4] net: remove kernel_setsockopt
Thread-Index: AQHWNbIjs7aulgkmyEm+cXWG7d/0Sai+/RtQ
Date: Fri, 29 May 2020 12:27:12 +0000
Message-ID: <d95348e2191046e9986860e3f1023491@AcuMS.aculab.com>
References: <20200529120943.101454-1-hch@lst.de>
	<20200529120943.101454-5-hch@lst.de>
In-Reply-To: <20200529120943.101454-5-hch@lst.de>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 04TCRLIb008649
X-loop: cluster-devel@redhat.com
Cc: "cluster-devel@redhat.com" <cluster-devel@redhat.com>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"linux-sctp@vger.kernel.org" <linux-sctp@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [Cluster-devel] [PATCH 4/4] net: remove kernel_setsockopt
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Christoph Hellwig
> Sent: 29 May 2020 13:10
> 
> No users left.

There is no point even proposing this until all the changes to remove
its use have made it at least as far into 'net-next' and probably 'net'.

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)


