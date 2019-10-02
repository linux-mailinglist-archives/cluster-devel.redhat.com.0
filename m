Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id B2F6EC9055
	for <lists+cluster-devel@lfdr.de>; Wed,  2 Oct 2019 20:03:05 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E314318C890B;
	Wed,  2 Oct 2019 18:03:03 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F132E60BF3;
	Wed,  2 Oct 2019 18:03:02 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id BFF1318089C8;
	Wed,  2 Oct 2019 18:02:59 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x92HkmRF011981 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 2 Oct 2019 13:46:48 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 392455C22F; Wed,  2 Oct 2019 17:46:48 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mx1.redhat.com (ext-mx29.extmail.prod.ext.phx2.redhat.com
	[10.5.110.70])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C927C5C226;
	Wed,  2 Oct 2019 17:46:43 +0000 (UTC)
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
	[209.85.215.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9485F18C890B;
	Wed,  2 Oct 2019 17:46:42 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id v27so12235512pgk.10;
	Wed, 02 Oct 2019 10:46:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=e09g4DE4GMBAg/LjnbwQq27CQNtOo7EPR5oJ0HS2cqg=;
	b=tPwomXx9uELPa6HaIJ+/E2c2pNZUBjZgwoXe+GSk/+PxubNo+giOXWasw0tzbm3nBz
	f7EFDGNPFGlCsOhF3YQybOfjz9/Khu0pWWjtkJKNAwprBHAegBd5vrKoINsFL48pFM+P
	j8ytCRJyvzx3XQtE3ZyExB+lC0yDI+RIY6Bcy1V+NUM2pK027zbJ9REWZ/1vsZ97kaUa
	xdCbGuRk+VUO9abBlnhqbR9Fjs8JwpA42CwNU1V473pNNZFG+hNuzRydyPd1F2HXYwEO
	jFPlgDx7lhry6LoWKHd5IqUZJHp47KKl3W01VNpnofNBpI6ueMTk7kE3o2Y2SHj7JyPq
	BkgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=e09g4DE4GMBAg/LjnbwQq27CQNtOo7EPR5oJ0HS2cqg=;
	b=RAnjbCsjhrvpcX5f8aOyXeMYDuquWZtHmZtZdBXBDF525ddRuQkLryzMnilf6G70Iq
	SiKmowLCmbmMUeXkx9u4W1A569mXj0ZofygWzaI0sLy4eynNukXGhTVB8aEU1x/g7EAS
	xH4+MG0qIX+53Lea6mBNrGMpXbgI/3zYE97JPQay82SOTrVKzB7iPyCoXeBsOlRSwQfH
	EaauISE6PcYJ/DlP5nd4y8EfAZiOVGEyaS5dtFXsvKvd0umAEcyfklu3SmYLmWUpkxl3
	x51jl+/fOUS5Eq2MFOrNBVL652Om9eQIB/RYK3G6jd0iLDxrjeY/quFXhTGq7peL+o54
	D+5g==
X-Gm-Message-State: APjAAAUsCjs5bEMPJaQYrZzuqtTHRhw1AYJkyn0TZaTZ5VnjxbDwZgpi
	gkj66V1OwU22/4SvSGBtRURYsJTKCkA=
X-Google-Smtp-Source: APXvYqxY7kb2N/WuKOe4+BNcW7O6HglZX64dx4Fz/DXyylZOIMn/uwmIIjhO0q1VxQIGR5nl/OG5ug==
X-Received: by 2002:a63:fb55:: with SMTP id w21mr5003272pgj.267.1570038401462; 
	Wed, 02 Oct 2019 10:46:41 -0700 (PDT)
Received: from localhost.localdomain ([103.241.225.67])
	by smtp.gmail.com with ESMTPSA id 202sm74561pfu.161.2019.10.02.10.46.38
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 02 Oct 2019 10:46:40 -0700 (PDT)
From: aliasgar.surti500@gmail.com
To: rpeterso@redhat.com, agruenba@redhat.com, cluster-devel@redhat.com,
	linux-kernel@vger.kernel.org
Date: Wed,  2 Oct 2019 23:16:31 +0530
Message-Id: <20191002174631.15919-1-aliasgar.surti500@gmail.com>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
	(mx1.redhat.com [10.5.110.70]);
	Wed, 02 Oct 2019 17:46:42 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.70]);
	Wed, 02 Oct 2019 17:46:42 +0000 (UTC) for IP:'209.85.215.194'
	DOMAIN:'mail-pg1-f194.google.com' HELO:'mail-pg1-f194.google.com'
	FROM:'aliasgar.surti500@gmail.com' RCPT:''
X-RedHat-Spam-Score: 0.15  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2, SPF_HELO_NONE,
	SPF_PASS) 209.85.215.194 mail-pg1-f194.google.com 209.85.215.194
	mail-pg1-f194.google.com <aliasgar.surti500@gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.70
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: cluster-devel@redhat.com
X-Mailman-Approved-At: Wed, 02 Oct 2019 14:02:55 -0400
Cc: Aliasgar Surti <aliasgar.surti500@gmail.com>
Subject: [Cluster-devel] [PATCH] gfs2: removed unnecessary semicolon
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.70]); Wed, 02 Oct 2019 18:03:04 +0000 (UTC)

From: Aliasgar Surti <aliasgar.surti500@gmail.com>

There is use of unnecessary semicolon after switch case.
Removed the semicolon.

Signed-off-by: Aliasgar Surti <aliasgar.surti500@gmail.com>
---
 fs/gfs2/recovery.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/gfs2/recovery.c b/fs/gfs2/recovery.c
index c529f8749a89..f4aa8551277b 100644
--- a/fs/gfs2/recovery.c
+++ b/fs/gfs2/recovery.c
@@ -326,7 +326,7 @@ void gfs2_recover_func(struct work_struct *work)
 
 		default:
 			goto fail;
-		};
+		}
 
 		error = gfs2_glock_nq_init(ip->i_gl, LM_ST_SHARED,
 					   LM_FLAG_NOEXP | GL_NOCACHE, &ji_gh);
-- 
2.17.1

