Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 8DE2A2E1481
	for <lists+cluster-devel@lfdr.de>; Wed, 23 Dec 2020 03:47:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1608691675;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=XnOO23br4Fu/UoTPm2ZeslaWyVgcgg79ItzazJ/4EF0=;
	b=J8Dwl6fhxuwGw9t9/00WYIX/eWuTSMCMvJCwTHcgLa0b54WwhG9ScuE418EebqC15X/KHX
	LDwgxQv3DD8z5NAlUmSPndQPvEqMRrLgdK1TfuccSO/h+m/psl1Zkwoh2aJag8IJ0fv/48
	LMQTSNPEYsiBruu5jDdKQWjaIeHySLM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-415-zUANssxOPVWwVeAYgqoPpA-1; Tue, 22 Dec 2020 21:47:54 -0500
X-MC-Unique: zUANssxOPVWwVeAYgqoPpA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DAF4410051AA;
	Wed, 23 Dec 2020 02:47:50 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 42E8BE2E0;
	Wed, 23 Dec 2020 02:47:50 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4A5BC4BB7B;
	Wed, 23 Dec 2020 02:47:47 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0BN2lgQi002130 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 22 Dec 2020 21:47:42 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id AD0B45F9B5; Wed, 23 Dec 2020 02:47:42 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from colo-mx.corp.redhat.com
	(colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9ABE35F9A7;
	Wed, 23 Dec 2020 02:47:39 +0000 (UTC)
Received: from zmail21.collab.prod.int.phx2.redhat.com
	(zmail21.collab.prod.int.phx2.redhat.com [10.5.83.24])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 90ACE18095C9;
	Wed, 23 Dec 2020 02:47:39 +0000 (UTC)
Date: Tue, 22 Dec 2020 21:47:37 -0500 (EST)
From: Bob Peterson <rpeterso@redhat.com>
To: Andreas Gruenbacher <agruenba@redhat.com>
Message-ID: <1734775184.38918835.1608691657308.JavaMail.zimbra@redhat.com>
In-Reply-To: <CAHc6FU5w=7CLrqYzE==4Vt39+Mfv4ZNX_PVi7KShqNYzedLeag@mail.gmail.com>
References: <290202568.38904309.1608669529163.JavaMail.zimbra@redhat.com>
	<2125295377.38904313.1608669538740.JavaMail.zimbra@redhat.com>
	<CAHc6FU5w=7CLrqYzE==4Vt39+Mfv4ZNX_PVi7KShqNYzedLeag@mail.gmail.com>
MIME-Version: 1.0
X-Originating-IP: [10.3.112.81, 10.4.195.18]
Thread-Topic: gfs2: make recovery workqueue operate on a gfs2 mount point,
	not journal
Thread-Index: cjeq5RRTT0MsdeNHpxp5Tit3Gwd3EQ==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: cluster-devel@redhat.com
Cc: cluster-devel <cluster-devel@redhat.com>
Subject: Re: [Cluster-devel] [GFS2 PATCH] gfs2: make recovery workqueue
 operate on a gfs2 mount point, not journal
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

----- Original Message -----
> On Tue, Dec 22, 2020 at 9:39 PM Bob Peterson <rpeterso@redhat.com> wrote:
> >
> > Hi,
> >
> > Before this patch, journal recovery was done by a workqueue function that
> > operated on a per-journal basis. The problem is, these could run
> > simultaneously
> > which meant that they could all use the same bio, sd_log_bio, to do their
> > writing to all the various journals. These operations overwrote one another
> > eventually causing memory corruption.
> >
> > This patch makes the recovery workqueue operate on a per-superblock basis,
> > which means a mount point using, for example journal0, could do recovery
> > for all journals that need recovery. This is done consecutively so the
> > sd_log_bio is only referenced by one recovery at a time, thus avoiding the
> > chaos.
> >
> > Since the journal recovery requests can come in any order, and
> > unpredictably,
> > the new work func loops until there are no more journals to be recovered.
> >
> > Since multiple processes may request recovery of a journal, and since they
> > all now use the same sdp-based workqueue, it's okay for them to get an
> > error from queue_work: Queueing work while there's already work queued.
> >
> > Signed-off-by: Bob Peterson <rpeterso@redhat.com>
> 
> Can't this be a simple loop like below?
> 
> repeat:
>         spin_lock(&sdp->sd_jindex_spin);
>         list_for_each_entry(jd, &sdp->sd_jindex_list, jd_list) {
>                 if (test_bit(JDF_RECOVERY, &jd->jd_flags)) {
>                         spin_unlock(&sdp->sd_jindex_spin);
>                         gfs2_recover_one(jd);
>                         goto repeat;
>                 }
>         }
>         spin_unlock(&sdp->sd_jindex_spin);
> 

Yes, that's just as effective. I just hate gotos. Whichever you prefer is fine with me.
I'm okay with not reporting the count too.

Bob

