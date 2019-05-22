Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id B9173263AE
	for <lists+cluster-devel@lfdr.de>; Wed, 22 May 2019 14:20:42 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 32820307E051;
	Wed, 22 May 2019 12:20:25 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E44FE5D9C3;
	Wed, 22 May 2019 12:20:15 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0717E1806B16;
	Wed, 22 May 2019 12:20:05 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x4MCJsX9019757 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 22 May 2019 08:19:54 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 04B285429D; Wed, 22 May 2019 12:19:54 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mx1.redhat.com (ext-mx10.extmail.prod.ext.phx2.redhat.com
	[10.5.110.39])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 004D75429C
	for <cluster-devel@redhat.com>; Wed, 22 May 2019 12:19:51 +0000 (UTC)
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com
	[209.85.210.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id CBDB35946B
	for <cluster-devel@redhat.com>; Wed, 22 May 2019 12:19:51 +0000 (UTC)
Received: by mail-ot1-f69.google.com with SMTP id q12so1096614oth.15
	for <cluster-devel@redhat.com>; Wed, 22 May 2019 05:19:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
	bh=qR0MaKhITKtU6hBO20rUhBwrXuT23cfT9o9u+4k7qjw=;
	b=DeZQ8U9JPzd3WlgzAPZgsqS7VnWiIjknbVVMrFUbMoGtuXz0zgddVqRuWE9vXzmYTY
	YWvsmCB9bBMss0ygR39vZwTUo7/dXAJUca8mt9tZvNY+ksixUdEAKXTqzFz3/uULcWeK
	FZJi+5HkovVqFNHM33wwPeeDl2X4qneqykDAp+O7ujEcuV6GYbi+HvacbIenPMA8U0nb
	R730Fwy7p18NN7I40hQEp75J3KVmsLyMhaAnW+rwQB3GWG3kegDPXEzGlmy3LLrPf1Rb
	6xvDhwCGrek+XjEbg9koGwOnEQTMFSCnAhAXRv/JUfRmgAYwcUOiPsk84y6LL0NAgFfp
	xGvg==
X-Gm-Message-State: APjAAAXhM0AA4yHlWgspwMEUl9COD0cBdkciXKllD17Ruu4w6p5JRm4X
	LpzdoKpKDuicoV3hRWQWGM8wv/MgsoRell4dbfwFGKEan8FiOY/KNC0v9uEnnjQrv21pDuwZQie
	gDyE78N7UJkzEIIV6+328OvmDaBm2EerxPi+FzQ==
X-Received: by 2002:a9d:63c1:: with SMTP id e1mr20475071otl.341.1558527591155; 
	Wed, 22 May 2019 05:19:51 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwDcWks8Ve32hEDwrgPlUaxWsbEp7qMwRFloclbktCS4gJ7NdKb2on86R3g9M+yYiMVnHNT87opgcNI0pRCrS8=
X-Received: by 2002:a9d:63c1:: with SMTP id e1mr20475056otl.341.1558527590980; 
	Wed, 22 May 2019 05:19:50 -0700 (PDT)
MIME-Version: 1.0
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Wed, 22 May 2019 14:19:39 +0200
Message-ID: <CAHc6FU71Yp9Y8ZDrJnJ3AAQazW8-WpTCLCHWYu-+JQ2tTu4Ymg@mail.gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: cluster-devel@redhat.com
Cc: cluster-devel <cluster-devel@redhat.com>,
	LKML <linux-kernel@vger.kernel.org>
Subject: [Cluster-devel] [GIT PULL] gfs2: Fix sign extension bug in
	gfs2_update_stats
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.42]); Wed, 22 May 2019 12:20:41 +0000 (UTC)

Linus,

could you please pull the following gfs2 fix?

Thanks,
Andreas

The following changes since commit a188339ca5a396acc588e5851ed7e19f66b0ebd9:

  Linux 5.2-rc1 (2019-05-19 15:47:09 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/gfs2/linux-gfs2.git
tags/gfs2-5.1.fixes2

for you to fetch changes up to 5a5ec83d6ac974b12085cd99b196795f14079037:

  gfs2: Fix sign extension bug in gfs2_update_stats (2019-05-22 14:09:44 +0200)

----------------------------------------------------------------
Fix a gfs2 sign extension bug introduced in v4.3.

----------------------------------------------------------------
Andreas Gruenbacher (1):
      gfs2: Fix sign extension bug in gfs2_update_stats

 fs/gfs2/lock_dlm.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

