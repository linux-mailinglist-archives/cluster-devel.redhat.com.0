Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 654251E815D
	for <lists+cluster-devel@lfdr.de>; Fri, 29 May 2020 17:12:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1590765124;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=4W0zV7ShLoJwMyDedm9KJ8SqbP/FjVOYnVv8NifDQHw=;
	b=jGWU7Rcv3sTpIJ3f5tLd1mv1fCRZ4yJJDmGNWkbvEuJMI3kFh6gTV5goLMTwpm5xFQac+W
	lF2tKRaVfiltaGlYgpxoOf+EakFypgUuWZSAci+vJ7nHbTSS9EPeEn0OhlaAMcc4hMI47p
	ttBR7drab7Y0C0NrM3G8psSVj7oHwMQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-161-Lp2-T_0qNdmECIji0Llyeg-1; Fri, 29 May 2020 11:12:02 -0400
X-MC-Unique: Lp2-T_0qNdmECIji0Llyeg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8E9908015CE;
	Fri, 29 May 2020 15:11:59 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4291360BF1;
	Fri, 29 May 2020 15:11:59 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id BF13F1809541;
	Fri, 29 May 2020 15:11:57 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04TFBq4a020964 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 29 May 2020 11:11:52 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 0A26E202696C; Fri, 29 May 2020 15:11:52 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 067142026DFD
	for <cluster-devel@redhat.com>; Fri, 29 May 2020 15:11:47 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BD6161049841
	for <cluster-devel@redhat.com>; Fri, 29 May 2020 15:11:47 +0000 (UTC)
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com
	[209.85.161.71]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-312-AMXo4td5PESH3MpBsXP3ag-1; Fri, 29 May 2020 11:11:46 -0400
X-MC-Unique: AMXo4td5PESH3MpBsXP3ag-1
Received: by mail-oo1-f71.google.com with SMTP id o9so1671356oos.21
	for <cluster-devel@redhat.com>; Fri, 29 May 2020 08:11:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
	bh=4W0zV7ShLoJwMyDedm9KJ8SqbP/FjVOYnVv8NifDQHw=;
	b=Lckk5yQbquYSrQFBL3TAdWpONdE3sPUvcnhdqlSfzEEj4mRBeCpslJ7cCZJI1CGaj1
	VFRUBEwZsrnnbRGgobBRW8n2hU/zxxUnWUNvkyprfJPARFra9fOs7QY6rkdMQHDtBBrV
	CbRrlLV6GMUvQXN/X82ZLMRZt84lwXvqlDnpeDCVuj/++aVi9ylZiNrn3MkHYEjkiWRB
	4n+3yklMv6XiVY61Ldp38e+tCoshlpUk4PYwzegeBZC4wJImO5r8uhsRpb4sGqfY8+Ya
	p89/HV5fqstWEwcXyrXth8s/NZ8hFc4jU74f2rXfU8TMc9HgxvO++hesW6v+LEmUGkX9
	9EYg==
X-Gm-Message-State: AOAM5325ceHtlcDFcALNdbgmQqKm35GKv0xeFUMoCsnrdP6ajsdl45H7
	8UI5cAE4wtubzJTCDob1XMiLbrct2xWXZqXT5T/ngNKDGDbjz2rSmcIITVZSaOj2CIceZlLA0KS
	3D50HnUOCOE3YQozYabR14dKPBerSWaGbEe4pgQ==
X-Received: by 2002:a05:6830:130d:: with SMTP id
	p13mr882740otq.95.1590765104856; 
	Fri, 29 May 2020 08:11:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx2zQDgYULMFpy9p6awx5V9rsziPlwX1/XoESwXNBALAkWYK09eTCs92hFzVjSe31uaobwZx8OcIfKWyHXx9Zo=
X-Received: by 2002:a05:6830:130d:: with SMTP id
	p13mr882723otq.95.1590765104587; 
	Fri, 29 May 2020 08:11:44 -0700 (PDT)
MIME-Version: 1.0
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Fri, 29 May 2020 17:11:33 +0200
Message-ID: <CAHc6FU6RofgpBz0t_DxGMKDbHJrVMcwHVBh63Pa6Tu2Wbiuaww@mail.gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: cluster-devel@redhat.com
Cc: cluster-devel <cluster-devel@redhat.com>,
	LKML <linux-kernel@vger.kernel.org>
Subject: [Cluster-devel] [GIT PULL] GFS2 fix for v5.7-rc7
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
Content-Type: text/plain; charset="UTF-8"

Hi Linus,

I've screwed up commit aa83da7f47b ("gfs2: More gfs2_find_jhead
fixes") which went into v5.7-rc6. Could you please consider pulling
the following fix?

Thanks a lot,
Andreas

The following changes since commit 9cb1fd0efd195590b828b9b865421ad345a4a145:

  Linux 5.7-rc7 (2020-05-24 15:32:54 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/gfs2/linux-gfs2.git
tags/gfs2-v5.7-rc7.fixes

for you to fetch changes up to 20be493b787cd581c9fffad7fcd6bfbe6af1050c:

  gfs2: Even more gfs2_find_jhead fixes (2020-05-29 17:00:24 +0200)

----------------------------------------------------------------
Fix the previous, flawed gfs2_find_jhead commit

----------------------------------------------------------------
Andreas Gruenbacher (1):
      gfs2: Even more gfs2_find_jhead fixes

 fs/gfs2/lops.c | 15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

