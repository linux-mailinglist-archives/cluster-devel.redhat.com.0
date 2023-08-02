Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 1006A76CA9A
	for <lists+cluster-devel@lfdr.de>; Wed,  2 Aug 2023 12:17:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1690971425;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=26w/YHJJAOuu8BibBnZpcCYYnfCRwjlC//rYUoKOWro=;
	b=NmleZw2ql1yidpKZ73f+3GFVolNpAVKo1brh3j6eWfJAODU7y80LJCL9JQOOUyrz6ym2O2
	lh2HyqSD9RRXib2rNybMqcg2IwR50TWnqBz1gHsZ4DtALKy4YBk1oucG+V9ldtXOSXPYJz
	obL8EsN3ThISPOu/gUDHEtEGzGtUMiA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-196-HnLvaVkWOWupEr3iZ200TQ-1; Wed, 02 Aug 2023 06:17:00 -0400
X-MC-Unique: HnLvaVkWOWupEr3iZ200TQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0209B856F67;
	Wed,  2 Aug 2023 10:17:00 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9AD60C57963;
	Wed,  2 Aug 2023 10:16:55 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 6A8A01946A72;
	Wed,  2 Aug 2023 10:16:48 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id D06321946A43 for <cluster-devel@listman.corp.redhat.com>;
 Wed,  2 Aug 2023 07:35:32 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id AF68E2166B26; Wed,  2 Aug 2023 07:35:32 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A68612166B25
 for <cluster-devel@redhat.com>; Wed,  2 Aug 2023 07:35:32 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8A44C830DB1
 for <cluster-devel@redhat.com>; Wed,  2 Aug 2023 07:35:32 +0000 (UTC)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com
 [209.85.208.54]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-423-9tYgiR6UPwmsYGGWvOljBw-1; Wed, 02 Aug 2023 03:35:30 -0400
X-MC-Unique: 9tYgiR6UPwmsYGGWvOljBw-1
Received: by mail-ed1-f54.google.com with SMTP id
 4fb4d7f45d1cf-5221f3affe4so8768951a12.0
 for <cluster-devel@redhat.com>; Wed, 02 Aug 2023 00:35:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690961729; x=1691566529;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=26w/YHJJAOuu8BibBnZpcCYYnfCRwjlC//rYUoKOWro=;
 b=MHLD2LyDhFlehFiYHxzxAhAuvjVnK4m+3h2K+K/PjVUjcVLx/vuUnwV8BC/Iv5A7N5
 p94KcPsPL08f4ISlkfT9t5PZJ+0qwqSl9DvssRiNTuu2pPpQ1mqrWgAlIaV7YFhc7PAL
 4OoiVFxPqVe84fzKOkKxexZFa3vytOlR8M4Orl82ofOJqS/SPK+geFJ5T8W75eGzoDGK
 2wVY3pvfJ565zIrQIeKBqGpM1dtB8iTu+RrVzOq5pASbZEMQQoolk7vipOC9UTrJf+cF
 TrBXzdvF3rGoY1H0VmgSxltKrpLaCXtDLaxZGEq94CtDhva6mfygtSy1ZzBnipBu41+X
 FBcA==
X-Gm-Message-State: ABy/qLav02huHeiWJp7NH5i05T3SYAvp2thUKExTkev8PQEncZ5VpsW2
 8W5Keb+9aT8pm3xkDxa3HaKCA81LLA22tZlFukY=
X-Google-Smtp-Source: APBJJlH7M+QryG4QBt4yvLGV8pi3n/i3QMvtm06GCWxAO5fS4Alz5XOTAh6Gg/IBFa8QtVoCns52sA==
X-Received: by 2002:a05:6402:324:b0:522:595f:5a29 with SMTP id
 q4-20020a056402032400b00522595f5a29mr4472424edw.29.1690961729606; 
 Wed, 02 Aug 2023 00:35:29 -0700 (PDT)
Received: from localhost (h3221.n1.ips.mtn.co.ug. [41.210.178.33])
 by smtp.gmail.com with ESMTPSA id
 c7-20020aa7c747000000b0052237839229sm8053817eds.21.2023.08.02.00.35.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Aug 2023 00:35:29 -0700 (PDT)
Date: Wed, 2 Aug 2023 09:42:42 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: agruenba@redhat.com
Message-ID: <2e4e8d5b-f653-4900-ac68-34018c9f7145@moroto.mountain>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Mailman-Approved-At: Wed, 02 Aug 2023 10:16:47 +0000
Subject: [Cluster-devel] [bug report] gfs2: Use mapping->gfp_mask for
 metadata inodes
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
Cc: cluster-devel@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: linaro.org
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello Andreas Gruenbacher,

The patch 8f18190e3173: "gfs2: Use mapping->gfp_mask for metadata
inodes" from Jul 26, 2023 (linux-next), leads to the following Smatch
static checker warning:

	fs/gfs2/inode.c:286 gfs2_lookup_simple()
	error: 'inode' dereferencing possible ERR_PTR()

fs/gfs2/inode.c
    268 struct inode *gfs2_lookup_simple(struct inode *dip, const char *name)
    269 {
    270         struct qstr qstr;
    271         struct inode *inode;
    272         gfs2_str2qstr(&qstr, name);
    273         inode = gfs2_lookupi(dip, &qstr, 1);
    274         /* gfs2_lookupi has inconsistent callers: vfs
    275          * related routines expect NULL for no entry found,
    276          * gfs2_lookup_simple callers expect ENOENT
    277          * and do not check for NULL.

This comment is ancient.  I think how gfs2_lookupi() works is that if
there is an error it returns an error code, but if the file does not
exist it returns NULL.  (This is just based on vague assumptions about
how mixed error pointer/NULL functions work).

    278          */
    279         if (inode == NULL)
    280                 return ERR_PTR(-ENOENT);
    281 
    282         /*
    283          * Must not call back into the filesystem when allocating
    284          * pages in the metadata inode's address space.
    285          */
--> 286         mapping_set_gfp_mask(inode->i_mapping, GFP_NOFS);
                                     ^^^^^^^^^^^^^^^^
error pointer dereference

    287 
    288         return inode;
    289 }

regards,
dan carpenter

