Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id BD3551EA007
	for <lists+cluster-devel@lfdr.de>; Mon,  1 Jun 2020 10:27:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1591000049;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=PlMBAKqNh8eTHSDw0JACf1Xzwa2DFml2fu0Ayk32yDE=;
	b=G36JJqurISKtaCx2D9U/VcQIEANoKX16di4AFiYtpEH+TE+hVv7elKKP+LtvOB37l8xH1R
	xys1N6YUmoDOK7ZTK0GUsZSLkSn6yOs1b10LrwI+N/jv0GaLT10xcBSCYBvPxDe5DY0JmA
	7+sqk/NMYGU8JilxCCA1ZMgs2rHX/CM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-39-BFag295tNq6tjwYw0i3D5A-1; Mon, 01 Jun 2020 04:27:27 -0400
X-MC-Unique: BFag295tNq6tjwYw0i3D5A-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D3BDE108BD0B;
	Mon,  1 Jun 2020 08:27:24 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4CE147C098;
	Mon,  1 Jun 2020 08:27:24 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 00795938F2;
	Mon,  1 Jun 2020 08:27:22 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0518RHbO015602 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 1 Jun 2020 04:27:17 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 1366EF5688; Mon,  1 Jun 2020 08:27:17 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EDDB9A4868
	for <cluster-devel@redhat.com>; Mon,  1 Jun 2020 08:27:15 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E55FB80CDAE
	for <cluster-devel@redhat.com>; Mon,  1 Jun 2020 08:27:14 +0000 (UTC)
Received: from eu-smtp-delivery-151.mimecast.com
	(eu-smtp-delivery-151.mimecast.com [207.82.80.151]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-462-AKySCL8EObyMnG-cIPY5nw-1;
	Mon, 01 Jun 2020 04:27:11 -0400
X-MC-Unique: AKySCL8EObyMnG-cIPY5nw-1
Received: from AcuMS.aculab.com (156.67.243.126 [156.67.243.126]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	uk-mta-4-qyf_xz7jMHaz2OtF4B_ISQ-1; Mon, 01 Jun 2020 09:27:08 +0100
X-MC-Unique: qyf_xz7jMHaz2OtF4B_ISQ-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) by
	AcuMS.aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) with Microsoft
	SMTP Server (TLS) id 15.0.1347.2; Mon, 1 Jun 2020 09:27:08 +0100
Received: from AcuMS.Aculab.com ([fe80::43c:695e:880f:8750]) by
	AcuMS.aculab.com ([fe80::43c:695e:880f:8750%12]) with mapi id
	15.00.1347.000; Mon, 1 Jun 2020 09:27:08 +0100
From: David Laight <David.Laight@aculab.com>
To: "'Marcelo Ricardo Leitner'" <marcelo.leitner@gmail.com>, Christoph Hellwig
	<hch@lst.de>
Thread-Topic: [PATCH 2/4] sctp: refactor sctp_setsockopt_bindx
Thread-Index: AQHWNdMG2Q0k5UY/FEi3sQ5al/OVkajDcLLw
Date: Mon, 1 Jun 2020 08:27:08 +0000
Message-ID: <ef0754831c294934b67f89fd8c5e1b5b@AcuMS.aculab.com>
References: <20200529120943.101454-1-hch@lst.de>
	<20200529120943.101454-3-hch@lst.de>
	<20200529160544.GI2491@localhost.localdomain>
In-Reply-To: <20200529160544.GI2491@localhost.localdomain>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 0518RHbO015602
X-loop: cluster-devel@redhat.com
Cc: Neil Horman <nhorman@tuxdriver.com>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	Vlad Yasevich <vyasevich@gmail.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"cluster-devel@redhat.com" <cluster-devel@redhat.com>,
	"linux-sctp@vger.kernel.org" <linux-sctp@vger.kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, "David S. Miller" <davem@davemloft.net>
Subject: Re: [Cluster-devel] [PATCH 2/4] sctp: refactor sctp_setsockopt_bindx
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Marcelo Ricardo Leitner
> Sent: 29 May 2020 17:06
> On Fri, May 29, 2020 at 02:09:41PM +0200, Christoph Hellwig wrote:
> > Split out a sctp_setsockopt_bindx_kernel that takes a kernel pointer
> > to the sockaddr and make sctp_setsockopt_bindx a small wrapper around
> > it.  This prepares for adding a new bind_add proto op.
> >
> > Signed-off-by: Christoph Hellwig <hch@lst.de>
> 
> Acked-by: Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>
> 
> > ---
> >  net/sctp/socket.c | 61 ++++++++++++++++++++++-------------------------
> >  1 file changed, 28 insertions(+), 33 deletions(-)
> >
> > diff --git a/net/sctp/socket.c b/net/sctp/socket.c
> > index 827a9903ee288..6e745ac3c4a59 100644
> > --- a/net/sctp/socket.c
> > +++ b/net/sctp/socket.c
> > @@ -972,23 +972,22 @@ int sctp_asconf_mgmt(struct sctp_sock *sp, struct sctp_sockaddr_entry *addrw)
> >   * it.
> >   *
> >   * sk        The sk of the socket
> > - * addrs     The pointer to the addresses in user land
> > + * addrs     The pointer to the addresses
> >   * addrssize Size of the addrs buffer
> >   * op        Operation to perform (add or remove, see the flags of
> >   *           sctp_bindx)
> >   *
> >   * Returns 0 if ok, <0 errno code on error.
> >   */
> > -static int sctp_setsockopt_bindx(struct sock *sk,
> > -				 struct sockaddr __user *addrs,
> > -				 int addrs_size, int op)
> > +static int sctp_setsockopt_bindx_kernel(struct sock *sk,
                        const
> > +					struct sockaddr *addrs, int addrs_size,
> > +					int op)

The list of addresses ought to be 'const'.

IIRC that requires the test for 'port == 0' be moved down  a few layers.

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)


