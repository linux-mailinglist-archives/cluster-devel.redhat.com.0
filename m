Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 08EE58B90E
	for <lists+cluster-devel@lfdr.de>; Tue, 13 Aug 2019 14:48:08 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 497B487642;
	Tue, 13 Aug 2019 12:48:06 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2D1AE27086;
	Tue, 13 Aug 2019 12:48:04 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id DF588180B536;
	Tue, 13 Aug 2019 12:48:02 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x7DCluRI002994 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 13 Aug 2019 08:47:56 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 7DCD0821EA; Tue, 13 Aug 2019 12:47:56 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mx1.redhat.com (ext-mx01.extmail.prod.ext.phx2.redhat.com
	[10.5.110.25])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 77AEE80FF3
	for <cluster-devel@redhat.com>; Tue, 13 Aug 2019 12:47:54 +0000 (UTC)
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com
	[209.85.210.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 117DF81F10
	for <cluster-devel@redhat.com>; Tue, 13 Aug 2019 12:47:54 +0000 (UTC)
Received: by mail-ot1-f71.google.com with SMTP id p7so90765390otk.22
	for <cluster-devel@redhat.com>; Tue, 13 Aug 2019 05:47:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=k6aoQTjuE5HiqXxVhmrH0ks3KPbSc/aqIrGsHPyfZ4w=;
	b=FCh1xvuFJ9KOJG++FGdl+sYllARQy8pWZLYxXDrpQnWbEA6XrgLtjZw99uQnYNLZF/
	sI57LmZTDWeSxPmySdJzKtNH/sMQuFRJt6V0WFxJLbFydFSOeDOgkm4ZNRvKU2FmZdSl
	wGf3PZnjJ01IXZAuqY7o0Bk4ipQHBgIPmgUgecJd4wsqiKUAqHgFEUt3QXpJDAdUpbVd
	JQtGHIeDKSCAB+zLmZhsSV5+/j2N4tsV3A2vBMBslGMTYxEppK9vCDPc2bl5pnmfY1KL
	Mbk3fOuQMmk1AsnhknG+B9+MGcgMyjrOn4bL/6tQ2SH0680xbobr1vmhjOSHhMEfWLz5
	HP9w==
X-Gm-Message-State: APjAAAWFvEgbidsLp/asdfF6lvtKMs2MvXP7m5NOfk0TZPCFNu1idRLe
	FYYNWuNzbkufCLYWzi0JkoZWHFMOy0kwu1CGf7LHAifv00x/MlRpErF80Hx3hLUa/JWo1z1ho5T
	/0ONxj9zJVdPQw8oTV97W4uSN7sls7+u1aFUIBw==
X-Received: by 2002:aca:cf51:: with SMTP id f78mr1284253oig.10.1565700473542; 
	Tue, 13 Aug 2019 05:47:53 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyHKwUdTSLvHhdGluLDLATltIVDAxUmuyrJz7LwkyLCfkSkPdHMVL8YgsEndPipqI0rKTT2wgzTCajjcQ/y+XE=
X-Received: by 2002:aca:cf51:: with SMTP id f78mr1284246oig.10.1565700473243; 
	Tue, 13 Aug 2019 05:47:53 -0700 (PDT)
MIME-Version: 1.0
References: <b7ecf30b-4a11-22b7-321d-a7eb539a7916@citrix.com>
In-Reply-To: <b7ecf30b-4a11-22b7-321d-a7eb539a7916@citrix.com>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Tue, 13 Aug 2019 14:47:42 +0200
Message-ID: <CAHc6FU7xhw1OEoB_9TLu0+PSHqOB7XH-NuY0xb82Fc4+Gi-svA@mail.gmail.com>
To: =?UTF-8?B?RWR3aW4gVMO2csO2aw==?= <edvin.torok@citrix.com>
Content-Type: text/plain; charset="UTF-8"
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Content-Transfer-Encoding: 8bit
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id x7DCluRI002994
X-loop: cluster-devel@redhat.com
Cc: Sergey Dyasli <sergey.dyasli@citrix.com>,
	Igor Druzhinin <igor.druzhinin@citrix.com>,
	cluster-devel <cluster-devel@redhat.com>, Mark Syms <Mark.Syms@citrix.com>
Subject: Re: [Cluster-devel] GFS2 deadlock in 4.19 (iomap/writeback?)
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.26]); Tue, 13 Aug 2019 12:48:06 +0000 (UTC)

Hi Edwin and all,

On Wed, 6 Mar 2019 at 12:08, Edwin Török <edvin.torok@citrix.com> wrote:
>
> Hello,
>
> I've been trying to debug a GFS2 deadlock that we see in our lab quite frequently with a 4.19 kernel. With 4.4 and older kernels we were not able to reproduce this.
> See below for lockdep dumps and stacktraces.
> Ignoring the lockdep warnings mentioned in my previous email I think I narrowed down the problem to a deadlock between iomap and writeback:
>
> IIUC the sequence of calls leading up to this is:
>   aio_write ->
>       gfs2_file_write_iter ->
>             iomap_file_buffered_write ->
>               iomap_apply ->
>                  iomap_begin -> gfs2_iomap_begin_write -> gfs2_trans_begin -> down_read(&sdp->sd_log_flush_lock)
>                  iomap_write_actor ->
>                     balance_dirty_pages ->
>   ... waits for writeback ...

it took us several iterations, but that deadlock and all the follow-up
issues that were popping up should be fixed now. The deadlock fix
(gfs2: Fix iomap write page reclaim deadlock) required a follow-up fix
(gfs2: Inode dirtying fix) and caused a performance regression (iomap:
don't mark the inode dirty in iomap_write_end); in addition, function
gfs2_walk_metadata from v4.18 turned out to have issues (gfs2:
gfs2_walk_metadata fix). This should all be working fine in v5.3-rc4
now.

We're working on getting Bob's recovery patch queue ready for the next
merge window, which should fix the issues you've been seeing with
iSCSI failures. The changes for that will be close to what's on the
for-next.recovery10 branch in the gfs2 repository right now. If you
can still reproduce problems with that code base, please do let us
know.

Thanks,
Andreas

