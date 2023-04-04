Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 377B86D6845
	for <lists+cluster-devel@lfdr.de>; Tue,  4 Apr 2023 18:04:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1680624286;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=2wyXRFn15U7YuTtccu17S72kQxdrsvbnQJV5citpTBw=;
	b=bDRDXQVaPB3yzf9rYpO7hmbhIVdcH5m9gygMK81wvOVJvmneRx3rEYA9z4AwWm29PFhTYd
	fRrmNPHZPIoyJiSHUc1ALNN6RH1e0hYVWecamygOnJsv/omVgmTz4J3G9TJmxwl4Os+w7u
	3qCVw7pJBEtk45fIjmpBB2WtTBLuNyE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-316-ehlGMzZGN0CWMagzgiJlFg-1; Tue, 04 Apr 2023 12:04:41 -0400
X-MC-Unique: ehlGMzZGN0CWMagzgiJlFg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 01618100DEC8;
	Tue,  4 Apr 2023 16:02:48 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E96E240C20FA;
	Tue,  4 Apr 2023 16:02:47 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 589761946A4C;
	Tue,  4 Apr 2023 16:02:39 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 4659F194658D for <cluster-devel@listman.corp.redhat.com>;
 Tue,  4 Apr 2023 14:55:59 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 36FE6483EC1; Tue,  4 Apr 2023 14:55:59 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2F78E400F57
 for <cluster-devel@redhat.com>; Tue,  4 Apr 2023 14:55:59 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 130993C0F241
 for <cluster-devel@redhat.com>; Tue,  4 Apr 2023 14:55:59 +0000 (UTC)
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-507-zXgCZXe8OK-VgM2hM2fQKg-1; Tue, 04 Apr 2023 10:55:56 -0400
X-MC-Unique: zXgCZXe8OK-VgM2hM2fQKg-1
Received: by mail-qt1-f198.google.com with SMTP id
 r22-20020ac85c96000000b003e638022bc9so10336092qta.5
 for <cluster-devel@redhat.com>; Tue, 04 Apr 2023 07:55:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680620156;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2wyXRFn15U7YuTtccu17S72kQxdrsvbnQJV5citpTBw=;
 b=odlTBpWXNombZdaFbllo5Rw6U6XFyeIxeSE7N7K7RtJiolTnUa0PXH0QzHMTLNoxn0
 7emdxUxK7IhA6kEfR4aFQ9vl7tEIRPsFyvCtEWrmr2kXRT04l8NKc4KD9GI5HP9yEYBI
 qg9mBHFB4Eq6wPx2cb9y1wsSUG17b4Bhsl0FvkasQa+q2sGX9F91zUwIzaMka4geqcZF
 /Kn25fJh50NlK68L0oyvyTgHEgQHlRgY8xu1n/45RDC5xxeGWWE811etFHxVs3tCR9Ba
 HyMZIF/WcQrR9Zs3McH28ftFc3u+Pa9zjmQ1XY0PmcW9/3aldnbJoxSSmpb35zy5iwWV
 b4/Q==
X-Gm-Message-State: AAQBX9f7jI9suZLgNYVPC3LXU4tRugABVEOCugZtElvJ13XVfjm5eYsg
 ww1rRUbYBqUBuYdj3orwcU6ORt/5N5ayPk6g0R+8T3J3n1pYv76UcEQvdj4Nr4Dlc/hpaOD6xUc
 yQgDPB6gW0jDR0riQuDBL
X-Received: by 2002:a05:6214:202b:b0:57e:67c2:b9cd with SMTP id
 11-20020a056214202b00b0057e67c2b9cdmr4447877qvf.27.1680620156130; 
 Tue, 04 Apr 2023 07:55:56 -0700 (PDT)
X-Google-Smtp-Source: AKy350bJb0tNOFsr5rCdSnciXn4UvwnouNwwbFSTjZxZAVItCMscXXWD/V0CsYzmlqPKXH2vmnAZgg==
X-Received: by 2002:a05:6214:202b:b0:57e:67c2:b9cd with SMTP id
 11-20020a056214202b00b0057e67c2b9cdmr4447836qvf.27.1680620155884; 
 Tue, 04 Apr 2023 07:55:55 -0700 (PDT)
Received: from aalbersh.remote.csb ([109.183.6.197])
 by smtp.gmail.com with ESMTPSA id
 j4-20020ac86644000000b003e6387431dcsm3296539qtp.7.2023.04.04.07.55.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Apr 2023 07:55:55 -0700 (PDT)
From: Andrey Albershteyn <aalbersh@redhat.com>
To: djwong@kernel.org, dchinner@redhat.com, ebiggers@kernel.org,
 hch@infradead.org, linux-xfs@vger.kernel.org, fsverity@lists.linux.dev
Date: Tue,  4 Apr 2023 16:53:18 +0200
Message-Id: <20230404145319.2057051-23-aalbersh@redhat.com>
In-Reply-To: <20230404145319.2057051-1-aalbersh@redhat.com>
References: <20230404145319.2057051-1-aalbersh@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mailman-Approved-At: Tue, 04 Apr 2023 16:02:32 +0000
Subject: [Cluster-devel] [PATCH v2 22/23] xfs: add fs-verity ioctls
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/cluster-devel>, 
 <mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/cluster-devel/>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/cluster-devel>,
 <mailto:cluster-devel-request@redhat.com?subject=subscribe>
Cc: linux-ext4@vger.kernel.org, damien.lemoal@opensource.wdc.com,
 chao@kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 cluster-devel@redhat.com, xiang@kernel.org, jth@kernel.org,
 linux-erofs@lists.ozlabs.org, Andrey Albershteyn <aalbersh@redhat.com>,
 linux-btrfs@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

Add fs-verity ioctls to enable, dump metadata (descriptor and Merkle
tree pages) and obtain file's digest.

Signed-off-by: Andrey Albershteyn <aalbersh@redhat.com>
---
 fs/xfs/xfs_ioctl.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/fs/xfs/xfs_ioctl.c b/fs/xfs/xfs_ioctl.c
index 3d6d680b6cf3..ffa04f0aed4a 100644
--- a/fs/xfs/xfs_ioctl.c
+++ b/fs/xfs/xfs_ioctl.c
@@ -42,6 +42,7 @@
 #include <linux/mount.h>
 #include <linux/namei.h>
 #include <linux/fileattr.h>
+#include <linux/fsverity.h>
 
 /*
  * xfs_find_handle maps from userspace xfs_fsop_handlereq structure to
@@ -2154,6 +2155,22 @@ xfs_file_ioctl(
 		return error;
 	}
 
+	case FS_IOC_ENABLE_VERITY:
+		if (!xfs_has_verity(mp))
+			return -EOPNOTSUPP;
+		return fsverity_ioctl_enable(filp, (const void __user *)arg);
+
+	case FS_IOC_MEASURE_VERITY:
+		if (!xfs_has_verity(mp))
+			return -EOPNOTSUPP;
+		return fsverity_ioctl_measure(filp, (void __user *)arg);
+
+	case FS_IOC_READ_VERITY_METADATA:
+		if (!xfs_has_verity(mp))
+			return -EOPNOTSUPP;
+		return fsverity_ioctl_read_metadata(filp,
+						    (const void __user *)arg);
+
 	default:
 		return -ENOTTY;
 	}
-- 
2.38.4

