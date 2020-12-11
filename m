Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 877942D7B11
	for <lists+cluster-devel@lfdr.de>; Fri, 11 Dec 2020 17:39:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1607704745;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=YSER1cCBFAj0Ck9o0EyUD8psr7eO+zX9mE7hGFKG0No=;
	b=AMTxXSH9SrBuXI5QW1xup62W4d0hMZ6TuINOw7RoV4eZQgq8CTt0BoVrQrUC1OV7A5wDRL
	+kHzQgZE3l5ZowvlfI2E6Zv48Q5mEZ1rP2H05MNwdGEqNfcYsrIr+LEh/6AxsbGHcba++6
	vZAx+HAlOpmpIxjEMB3qSNiyf99YSuk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-263-_3ogyWwSMMKVuqlGpqclpw-1; Fri, 11 Dec 2020 11:39:03 -0500
X-MC-Unique: _3ogyWwSMMKVuqlGpqclpw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 68BCC800D53;
	Fri, 11 Dec 2020 16:39:01 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2D0D519C78;
	Fri, 11 Dec 2020 16:39:01 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id AC0AD5002C;
	Fri, 11 Dec 2020 16:39:00 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0BBGcuFk017617 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 11 Dec 2020 11:38:56 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 68DF9F1C92; Fri, 11 Dec 2020 16:38:56 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 61B78EE849
	for <cluster-devel@redhat.com>; Fri, 11 Dec 2020 16:38:50 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 58AFD85828A
	for <cluster-devel@redhat.com>; Fri, 11 Dec 2020 16:38:50 +0000 (UTC)
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
	[209.85.214.198]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-113-FGW4G6eYPUarseYi_6DYeQ-1; Fri, 11 Dec 2020 11:38:48 -0500
X-MC-Unique: FGW4G6eYPUarseYi_6DYeQ-1
Received: by mail-pl1-f198.google.com with SMTP id t14so4999211plr.15
	for <cluster-devel@redhat.com>; Fri, 11 Dec 2020 08:38:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=YSER1cCBFAj0Ck9o0EyUD8psr7eO+zX9mE7hGFKG0No=;
	b=cfsBVCzbk7PczDrFXhzgiYl13yuM53zqDpx+xhotRThSK0fKd6cUqaNbTbVS9WaKr5
	ZXhYAs56dT9zj4ABMR3l1/Ju1pbxGfBInY4mVtxYtrljvln6cbAAgSsdmjmEtqMmIDs3
	nrQJ7KjmlRXaO17r1XTW/ZP3liMoWL/SS0lV4oMllG+NUv3zVKPv5D2W+jC0lfFWte9N
	I6MlwDn3KCF1Egf3NhuvAacSSduV8rqwY/xE5cF3oplh0176Iu3x/dh4C4dPUIwy+ft+
	3udCE/QYY4XyXBq1Mec/iUlAijcPyiJeFaY+F1vjao/WP4een+R4ze6P18QGUyN0q4bu
	flig==
X-Gm-Message-State: AOAM532FK+SlOIa1Krh0j5GYn8nL4xqcpDekMJEhiBw3Ra20MacZwXqa
	R0xljtsnB2sP32R9rt3+5voJ/ObazSjrRKJOYVZ2vv5unTkHZGw34eYY/dn1BRLlvNq56NzOQL7
	AnmelojEdU1eyR3Vdil3TPtLeHHSZh1bS81RG5A==
X-Received: by 2002:a17:902:aa8b:b029:da:ef22:8675 with SMTP id
	d11-20020a170902aa8bb02900daef228675mr11796638plr.15.1607704727149;
	Fri, 11 Dec 2020 08:38:47 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx02AyY1nrWq3Iaf6I85dRkAnUwY8RMQR1WH4d+/+j5q83X7xyr1kMZuC9ZMtIdUhenS49C5UR24Mo6WithtGk=
X-Received: by 2002:a17:902:aa8b:b029:da:ef22:8675 with SMTP id
	d11-20020a170902aa8bb02900daef228675mr11796633plr.15.1607704726920;
	Fri, 11 Dec 2020 08:38:46 -0800 (PST)
MIME-Version: 1.0
From: Abhijith Das <adas@redhat.com>
Date: Fri, 11 Dec 2020 10:38:36 -0600
Message-ID: <CACrDRjiiXtz6cOO8FmnZHKte2EVKAFzDESXJ5a8oALd7h+EizA@mail.gmail.com>
To: cluster-devel <cluster-devel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] Recording extents in GFS2
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
Content-Type: text/plain; charset="UTF-8"

Hi all,

With a recent set of patches, we nearly eliminated the per_node statfs
change files by recording that info in the journal. The files and some
recovery code remain only for backward compatibility. Similarly, I'd
like to get rid of the per_node quota change files and record that
info in the journal as well.

I've been talking to Andreas and Bob a bit about this and I'm
investigating how we can record extents as we allocate and deallocate
blocks instead of writing whole blocks. I'm looking into how XFS does
this.

We could have a new journal block type that adds a list of extents to
inodes with alloc/dealloc info. We could add in quota (uid/gid) info
to this as well. If we can do this right, the representation of
alloc/dealloc becomes compact and consequently we use journal space
more efficiently. We can hopefully avoid cases where we need to zero
out blocks during allocation as well.

I'm sending this out to start a discussion and to get ideas/comments/pointers.

Cheers!
--Abhi

