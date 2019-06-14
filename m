Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A1E246523
	for <lists+cluster-devel@lfdr.de>; Fri, 14 Jun 2019 18:55:44 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3F00AF74CE;
	Fri, 14 Jun 2019 16:55:35 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CB74F60C67;
	Fri, 14 Jun 2019 16:55:30 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E9A5E1806B11;
	Fri, 14 Jun 2019 16:55:26 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x5EGtG8v011430 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 14 Jun 2019 12:55:16 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id CAB8D19700; Fri, 14 Jun 2019 16:55:16 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mx1.redhat.com (ext-mx10.extmail.prod.ext.phx2.redhat.com
	[10.5.110.39])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C5C6719C67
	for <cluster-devel@redhat.com>; Fri, 14 Jun 2019 16:55:14 +0000 (UTC)
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com
	[209.85.210.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 756F95D61E
	for <cluster-devel@redhat.com>; Fri, 14 Jun 2019 16:55:14 +0000 (UTC)
Received: by mail-ot1-f72.google.com with SMTP id n20so1349872otl.5
	for <cluster-devel@redhat.com>; Fri, 14 Jun 2019 09:55:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
	bh=uCDoaz8aKWpO13fo3w+/O/u1UspM1FCDsjyWvamzqQU=;
	b=XDMkQffeOeblm1pyeajNJeto0FQ1rr+IfNIAoroZjEj5DLGmtedPaBQrn8pJTwrtlj
	TAV5M41J2VfhFvWw/PUNpDJpHZ8n60zDSFvb3ijp/r/7JmuvyCTWz0q+gN8AH1JW8jjF
	ZvySWJdyoBuMqFndI/bQPv1pIbZSrMu/smFjx/vJXDPQU7vmsDTW35GTMGDzj5cUSjPk
	iaNviGnxpmErJEHsjmFzvrpYvzOr5PZNpb0oscw2v0SJlW4subiI5c/9Hfh8ZAcZi6/d
	XuTHp3EPjbEaXx/dCDY832V8VApBqANcL8R+ojj634w8VMerN756hbQSzveTRWkI8vfB
	rdrA==
X-Gm-Message-State: APjAAAUnnz1R3BYYUeKPA9Up+A/ekH+Vo/2cTy5BkAlDvaEP2mWbI0Sf
	+EyrhO+0MxTziqJHthteAD85TqbWJicg4zCehsApzPqZ9zSFNiOhxSJgCgh3svDmMIkedSWVvVd
	OXWMV7xEccq237AfAFUGJaRHOCUkSsdYKLQir+w==
X-Received: by 2002:aca:342:: with SMTP id 63mr2349952oid.10.1560531313521;
	Fri, 14 Jun 2019 09:55:13 -0700 (PDT)
X-Google-Smtp-Source: APXvYqy0NUn4FSP3QtqqdPCPF8oryEc1IkqQfJ01gZ/4QulvGNLsv+5GPlEyyHacfI/g3qwf1evgUMXjoAL/lV4kuTc=
X-Received: by 2002:aca:342:: with SMTP id 63mr2349932oid.10.1560531313156;
	Fri, 14 Jun 2019 09:55:13 -0700 (PDT)
MIME-Version: 1.0
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Fri, 14 Jun 2019 18:55:02 +0200
Message-ID: <CAHc6FU7aKs3bUwjnPeLn4Nw82ojGcQxkJbDsgtVdXYVRjVW0bQ@mail.gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: cluster-devel@redhat.com
Cc: cluster-devel <cluster-devel@redhat.com>,
	LKML <linux-kernel@vger.kernel.org>
Subject: [Cluster-devel] [GIT PULL] gfs2: Fix rounding error in
	gfs2_iomap_page_prepare
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.38]); Fri, 14 Jun 2019 16:55:43 +0000 (UTC)

Hi Linus,

could you please pull the following gfs2 fix?

Thank you very much,
Andreas

The following changes since commit dc8ca9cc6e23054eb85599c9417ef2416848e7e8:

  Merge tag 'gfs2-v5.2.fixes' of
git://git.kernel.org/pub/scm/linux/kernel/git/gfs2/linux-gfs2
(2019-06-06 12:33:52 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/gfs2/linux-gfs2.git
tags/gfs2-v5.2.fixes2

for you to fetch changes up to 2741b6723bf6f7d92d07c44bd6a09c6e37f3f949:

  gfs2: Fix rounding error in gfs2_iomap_page_prepare (2019-06-14
18:49:07 +0200)

----------------------------------------------------------------
Fix rounding error in gfs2_iomap_page_prepare

----------------------------------------------------------------
Andreas Gruenbacher (1):
      gfs2: Fix rounding error in gfs2_iomap_page_prepare

 fs/gfs2/bmap.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

