Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 8254E26AD08
	for <lists+cluster-devel@lfdr.de>; Tue, 15 Sep 2020 21:08:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1600196915;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=0OMdth0yGOLLIhvHV70WrsWGowIwG4DS3qqRqPm/y8M=;
	b=OdHHYVXB4lZ1PCfBpkMW6/g8hALCnxtozM9BqT02eagHtDexW/I8XaRiB34H/YJuxH3jYh
	AslaH4UsSZORsUdY+pEDZ5qrX1aK5rjJbPxZbCY9yJkAPmC5kOrPRN4IrromsdSTXjyl14
	ln7pAAhp91QsJN7AFHPOm+JkjE9Glxk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-370-ikhSxhuzPBywQF0DKBQHUA-1; Tue, 15 Sep 2020 15:08:33 -0400
X-MC-Unique: ikhSxhuzPBywQF0DKBQHUA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 57ADD1006701;
	Tue, 15 Sep 2020 19:08:30 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CCE9975124;
	Tue, 15 Sep 2020 19:08:29 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B491044A59;
	Tue, 15 Sep 2020 19:08:27 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08FJ8LJi015508 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 15 Sep 2020 15:08:21 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id A187DEAF8E; Tue, 15 Sep 2020 19:08:21 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9CE8AE77BD
	for <cluster-devel@redhat.com>; Tue, 15 Sep 2020 19:08:19 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2790D101A53F
	for <cluster-devel@redhat.com>; Tue, 15 Sep 2020 19:08:19 +0000 (UTC)
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
	[209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-63-fra7RLoXOnSNb7d79x47eg-1; Tue, 15 Sep 2020 15:08:17 -0400
X-MC-Unique: fra7RLoXOnSNb7d79x47eg-1
Received: by mail-wr1-f69.google.com with SMTP id v5so1563339wrs.17
	for <cluster-devel@redhat.com>; Tue, 15 Sep 2020 12:08:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=0OMdth0yGOLLIhvHV70WrsWGowIwG4DS3qqRqPm/y8M=;
	b=ui4/yscJt6EUx+FCD+7i3RhKeJukQKn00iBm6LBvzBHRd8z6OmKyNKFzxY6Vimujv3
	1Upfzq7HtT6d545l5OQ8nrTLRrlVPHldYZT3Mp1adSrfD62EAZ3rrXHYiqOMl5JsNiAZ
	nDrF/F2u71+3GjH9Zl69WHPXEr9/ScCFQSGJ/n/ScFwwujDySQk85ttWRybeZnpvrwg7
	6sA+qOqODBeFO/fDnuwl8VuCwKkrWGrQhAqW9ftYlSn3PJAkDCMMgsixK9nFi2R4ppH4
	hdQTZQbuOsXL1Eazx/2oX4z6dVTw8gYqpqr8eVQGNOzbAKBoOGZ53suVbeBUoBTACRQE
	gbww==
X-Gm-Message-State: AOAM532RRrxtXRWyr496MRFHuT5XpdhLRJcKA6K6m+ISxgrjSy0h6vXt
	DOszkgxGyeLp3bxnO2TDBv6/ikhJZz+8a568Vaoy/fKzjhxZata2w7ly6Gpvth5zB/NY8VBvDK2
	Vntyr70D29QX6YYaF7BhSTctmpN/DTqUbrDp0ww==
X-Received: by 2002:a7b:c0c5:: with SMTP id s5mr806585wmh.152.1600196895851;
	Tue, 15 Sep 2020 12:08:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwlXkIltsnl3r4+xz0+jVauHwcO025Qm408fXIpiG8lWAvBSf2Tn51hRi8meCJDfpOvVOOvMn0StOSisYhwh9w=
X-Received: by 2002:a7b:c0c5:: with SMTP id s5mr806572wmh.152.1600196895660;
	Tue, 15 Sep 2020 12:08:15 -0700 (PDT)
MIME-Version: 1.0
References: <20200915143822.16485-1-rpeterso@redhat.com>
In-Reply-To: <20200915143822.16485-1-rpeterso@redhat.com>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Tue, 15 Sep 2020 21:08:04 +0200
Message-ID: <CAHc6FU4Am6Ke5Ot9b3ttQj_4Thk7Ws970gTNzwdBUNe1PvhZ6g@mail.gmail.com>
To: Bob Peterson <rpeterso@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: cluster-devel@redhat.com
Cc: cluster-devel <cluster-devel@redhat.com>
Subject: Re: [Cluster-devel] [GFS2 PATCH 0/5] Refactor gfs2_evict_inode
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

Bob,

On Tue, Sep 15, 2020 at 4:38 PM Bob Peterson <rpeterso@redhat.com> wrote:
> Function gfs2_evict_inode is very large and messy. This patch set is an
> attempt to simplify the function and make it more understandable. This
> will make it easier to maintain. I did this mainly because we need to fix
> it so it can call truncate_inode_pages on the inode glock's address space.

that refactoring looks good in principle; I'll follow up on the
individual patches with some more comments.

The glock's address space lifetime doesn't end with the life of the
associated inode though, so we should probably only call
truncate_inode_pages_final on the glock's address space when the glock
dies. (At that point, nrpages should be zero already, but
nrexceptional might still be nonzero.)

> Bob Peterson (5):
>   gfs2: switch variable error to ret in gfs2_evict_inode
>   gfs2: factor delete_evicted_inode out of gfs2_evict_inode
>   gfs2: further simplify gfs2_evict_inode with new func
>     may_delete_evicted
>   gfs2: factor out evict code related to dinodes we are not deleting
>   gfs2: simplify the logic in gfs2_evict_inode
>
>  fs/gfs2/super.c | 214 ++++++++++++++++++++++++++++++------------------
>  1 file changed, 136 insertions(+), 78 deletions(-)
>
> --
> 2.26.2
>

Thanks,
Andreas

