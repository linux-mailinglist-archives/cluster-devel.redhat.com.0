Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 622F337719
	for <lists+cluster-devel@lfdr.de>; Thu,  6 Jun 2019 16:48:06 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 99504307EA81;
	Thu,  6 Jun 2019 14:47:34 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 144355F7DD;
	Thu,  6 Jun 2019 14:47:20 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id EDD501843660;
	Thu,  6 Jun 2019 14:47:05 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x56EjCTo029260 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 6 Jun 2019 10:45:12 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 2D72B7BE7D; Thu,  6 Jun 2019 14:45:12 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mx1.redhat.com (ext-mx07.extmail.prod.ext.phx2.redhat.com
	[10.5.110.31])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 27B9D7BE79
	for <cluster-devel@redhat.com>; Thu,  6 Jun 2019 14:45:09 +0000 (UTC)
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com
	[209.85.167.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C2790C0578FA
	for <cluster-devel@redhat.com>; Thu,  6 Jun 2019 14:45:09 +0000 (UTC)
Received: by mail-oi1-f198.google.com with SMTP id c64so671280oia.22
	for <cluster-devel@redhat.com>; Thu, 06 Jun 2019 07:45:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
	bh=csaYIwXQEBX950eZ96n2wzROQkFVAMhN8cg2KCdNjEI=;
	b=fAKg3BMV1PRO4FYfqfmdryPB48AaVkXhQ5FLm0biOTp7UZOM0FsKROZSzbOZBhedZu
	2+fkMHQXLt5mB3NdICG2nSeHYYHWoKzw4WC89ACS0omiBjUyJBQWFPDRi8ikYV+M0zjj
	j+xD7lBKi+cZqCzwZRAfP51CNoKkDrsihNUvU3A4Ku4a073KlVWUA5XHIJmOVXmLT9QO
	jgaFV4QZy5BS4lITPesryA7AIEEasZruLWV9fzQnN3p05Xlj4pvnCMZgkGLKy0xLwZRH
	J9osHSjtIm1UX69TsxuMQvdLSy5xrmdGVfOd9lzEn4egBK8jx4GRaE8/m+mwtcTUbq+l
	B0Sg==
X-Gm-Message-State: APjAAAUwXfx7O9p5OV2gnGvlIdwfuw2fip7MRiXJ+VfyDAyS/G8L216D
	8IpxmQWLfvKnjgaD9aV4tWfXviXcpXHQlwGebjw8YgD3E2IcEFfTqFCRSEnt7Ghhs2/bRSfTaNz
	88iy244Vlgrh7SqU7rVckaPt/YxkKGAWK88+l8Q==
X-Received: by 2002:a9d:704f:: with SMTP id x15mr15024600otj.297.1559832309051;
	Thu, 06 Jun 2019 07:45:09 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzOiNSsDsz1tD3ucAPIfuAw+X51u3KUPDzK8U3WMrZ8VztMqbCKvv2H9Im2Ar2t1P4QYr7//APmNuZpKQS1yQM=
X-Received: by 2002:a9d:704f:: with SMTP id x15mr15024571otj.297.1559832308563;
	Thu, 06 Jun 2019 07:45:08 -0700 (PDT)
MIME-Version: 1.0
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Thu, 6 Jun 2019 16:44:57 +0200
Message-ID: <CAHc6FU6XnohtY0q365cxhx3-mAQqTCyHdL61XV1Z2wbTQL_EPg@mail.gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: cluster-devel@redhat.com
Cc: cluster-devel <cluster-devel@redhat.com>,
	LKML <linux-kernel@vger.kernel.org>
Subject: [Cluster-devel] [GET PULL] Revert "gfs2: Replace gl_revokes with a
	GLF flag"
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.44]); Thu, 06 Jun 2019 14:48:05 +0000 (UTC)

Hi Linus,

could you please pull the following revert? The patch turned out to be broken.

Thank you very much,
Andreas

The following changes since commit f2c7c76c5d0a443053e94adb9f0918fa2fb85c3a:

  Linux 5.2-rc3 (2019-06-02 13:55:33 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/gfs2/linux-gfs2.git
tags/gfs2-v5.2.fixes

for you to fetch changes up to 638803d4568121d73a266e440530f880ffa2dacc:

  Revert "gfs2: Replace gl_revokes with a GLF flag" (2019-06-06 16:29:26 +0200)

----------------------------------------------------------------
Revert commit "gfs2: Replace gl_revokes with a GLF flag".

----------------------------------------------------------------
Bob Peterson (1):
      Revert "gfs2: Replace gl_revokes with a GLF flag"

 fs/gfs2/glock.c  |  4 ++--
 fs/gfs2/incore.h |  2 +-
 fs/gfs2/log.c    |  4 +---
 fs/gfs2/lops.c   | 33 +++++++++------------------------
 fs/gfs2/main.c   |  1 +
 fs/gfs2/super.c  |  2 +-
 6 files changed, 15 insertions(+), 31 deletions(-)

