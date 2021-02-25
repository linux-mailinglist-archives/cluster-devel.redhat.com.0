Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 9A19A3255C9
	for <lists+cluster-devel@lfdr.de>; Thu, 25 Feb 2021 19:48:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1614278905;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=tNhzRHeup11UhoJF3bJwV/W1c3V4zqmWiCzwGpUBpnI=;
	b=HQotcOnmCnB0BGf+sD0Dfg9/Jlsp5+JTDHEgxvzQm8KmaoPxZQCo5z9aYtPEPW4ryP2nQA
	rrMVFqPKVSp65UHf5U4fe5+nVL49Cqp8XTlOKEKmnMDXFTGhDm4q4nn3LcQocgEFoXIQ9+
	xX/niQSUJ7ewIii/lnHa/D6ocXqmyx4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-491-gi-Xwp3YMLuaq_CE3fp53w-1; Thu, 25 Feb 2021 13:48:24 -0500
X-MC-Unique: gi-Xwp3YMLuaq_CE3fp53w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 23F93107ACC7;
	Thu, 25 Feb 2021 18:48:21 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8046577714;
	Thu, 25 Feb 2021 18:48:19 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A296358076;
	Thu, 25 Feb 2021 18:48:16 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 11PImBXx014381 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 25 Feb 2021 13:48:11 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 6AC1E10016FF; Thu, 25 Feb 2021 18:48:11 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from colo-mx.corp.redhat.com
	(colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 72AB610013D6;
	Thu, 25 Feb 2021 18:48:08 +0000 (UTC)
Received: from zmail21.collab.prod.int.phx2.redhat.com
	(zmail21.collab.prod.int.phx2.redhat.com [10.5.83.24])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 66AC858075;
	Thu, 25 Feb 2021 18:48:08 +0000 (UTC)
Date: Thu, 25 Feb 2021 13:48:06 -0500 (EST)
From: Bob Peterson <rpeterso@redhat.com>
To: Andreas Gruenbacher <agruenba@redhat.com>
Message-ID: <899455839.58326316.1614278886083.JavaMail.zimbra@redhat.com>
In-Reply-To: <CAHc6FU6fs+Oizg4acpn-afLW1atRrnHmfDx5F0YV3RjMvqe_Aw@mail.gmail.com>
References: <CACrDRjiiXtz6cOO8FmnZHKte2EVKAFzDESXJ5a8oALd7h+EizA@mail.gmail.com>
	<CACrDRjjOgEsqOSWK1PeMro4WQxKkmR=KEfCCRQzBGCwtY+fevQ@mail.gmail.com>
	<93452e4c-af81-225f-34f5-f297473164ae@redhat.com>
	<CAHc6FU6jQ3KGgKgQHy_WaX-40nqWxGbJNqmAcSFtJPweR7AtQg@mail.gmail.com>
	<cd213bd4-3bc0-bb8f-0e8f-de2a26a62731@redhat.com>
	<CAHc6FU4C1FaLjxZmz5USHS+Nruthto4WYhxqkW0wjB_h8tX6=g@mail.gmail.com>
	<CAHc6FU6fs+Oizg4acpn-afLW1atRrnHmfDx5F0YV3RjMvqe_Aw@mail.gmail.com>
MIME-Version: 1.0
X-Originating-IP: [10.3.114.41, 10.4.195.6]
Thread-Topic: Recording extents in GFS2
Thread-Index: ZCZR3Ttb9/epcGKMtUNDt5iwIdhybA==
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: cluster-devel@redhat.com
Cc: cluster-devel <cluster-devel@redhat.com>
Subject: Re: [Cluster-devel] Recording extents in GFS2
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/cluster-devel>, 
	<mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/cluster-devel>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=subscribe>
Sender: cluster-devel-bounces@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

----- Original Message -----
> >> once we change the journal format, in addition to recording block numbers
> >> as extents, there are some additional issues we should address at the same
> >> time:

One thing I've always thought we should improve upon was the way we manage
our bitmaps. Right now, if you allocate or free a block, unless it's on the
first block of the rgrp, we need to write two blocks: (1) One for the bitmap
that needs to change and, (2) Another for the rgrp to adjust its allocated and
free numbers. The rgrplvb code will make this faster, but it would be nice if
we would somehow keep "version 2" bitmaps such that each keeps its own statistics.

That way we only need to journal and write the affected bitmap, and not
necessarily its rgrp block as well. I could see us keep separate glocks
for each bitmap, for example, and allowing multiple nodes to work on the
same portion of the file system, but on unique bitmaps.

Bob

