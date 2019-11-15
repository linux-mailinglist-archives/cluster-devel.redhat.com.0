Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 975A9FE042
	for <lists+cluster-devel@lfdr.de>; Fri, 15 Nov 2019 15:39:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1573828797;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=WserYElr/h5m+bmmxYvca3BKD2BBsLWvRQhHrPmz4To=;
	b=McVPDAVZWSa16O2IaU5L/9Q7FAjPaR8S/Z6asplKuAF7PdIq78wgay93UfhpQqoXfUr7Rv
	pzsUHB83ae8uDWzyLIJB02xoC/l2CXUYw6hIL3DXcxGbANFaJH85t3n6dbNnv1AvifDUc/
	gD9oMA5LBXOGKI2WZBOqsM3dpGPDCBU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-280-cyzWUSIcOZu89CfBE3VDnQ-1; Fri, 15 Nov 2019 09:39:56 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DD4F785EE6A;
	Fri, 15 Nov 2019 14:39:53 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 49DAA66094;
	Fri, 15 Nov 2019 14:39:53 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1A72B18089CD;
	Fri, 15 Nov 2019 14:39:53 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xAFEdqmx002472 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 15 Nov 2019 09:39:52 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id F36B560135; Fri, 15 Nov 2019 14:39:51 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from colo-mx.corp.redhat.com
	(colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 232E26134B;
	Fri, 15 Nov 2019 14:39:49 +0000 (UTC)
Received: from zmail21.collab.prod.int.phx2.redhat.com
	(zmail21.collab.prod.int.phx2.redhat.com [10.5.83.24])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 10D0F4BB65;
	Fri, 15 Nov 2019 14:39:49 +0000 (UTC)
Date: Fri, 15 Nov 2019 09:39:49 -0500 (EST)
From: Bob Peterson <rpeterso@redhat.com>
To: Andreas Gruenbacher <agruenba@redhat.com>
Message-ID: <841385700.30232728.1573828789031.JavaMail.zimbra@redhat.com>
In-Reply-To: <CAHc6FU4Qy3WWxd7ZV1x74-_LnLpPxeNgsu4NYC9Bn=PDPvj=VQ@mail.gmail.com>
References: <709405430.29951966.1573751145790.JavaMail.zimbra@redhat.com>
	<CAHc6FU4Qy3WWxd7ZV1x74-_LnLpPxeNgsu4NYC9Bn=PDPvj=VQ@mail.gmail.com>
MIME-Version: 1.0
X-Originating-IP: [10.3.116.60, 10.4.195.19]
Thread-Topic: gfs2: initialize tr_ail1_list when creating transactions
Thread-Index: 4GwM1GnupIXzlWyoxGlytwHHaLGPNg==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: cluster-devel@redhat.com
Cc: cluster-devel <cluster-devel@redhat.com>
Subject: Re: [Cluster-devel] [GFS2 PATCH] gfs2: initialize tr_ail1_list when
 creating transactions
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: cyzWUSIcOZu89CfBE3VDnQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

----- Original Message -----
> On Thu, Nov 14, 2019 at 6:10 PM Bob Peterson <rpeterso@redhat.com> wrote:
> > In function gfs2_trans_begin, new transactions were created but their
> > ail1 list, tr_ail1_list was never initialized. Therefore it relied
> > upon other circumstances when the list became empty.
> > This patch adds proper initialization of the list.
>=20
> Could you please give a better explanation for this change?

Let's drop it for now. I'll reevaluate if it's still needed.

Bob

