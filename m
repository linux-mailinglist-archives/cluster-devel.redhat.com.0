Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B99696D82DE
	for <lists+cluster-devel@lfdr.de>; Wed,  5 Apr 2023 18:04:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1680710673;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=ezrY1MpbuGn54W85nscQkQabj0tChDh4QyAKrhiN160=;
	b=X7zG5QcN1QiFyHPpsYnVIWoVBtwwo+54bybHwK2d4DawOya5h2o+EAEsa+mSrZjVuONva8
	35nmpLVpTgJLl7wbvK6hBUG2P4p9rQuQAxlaKi42tPmh/OVOt48fsJa4HfFRrIqFBFYIZn
	nW+6JL4Yh/h2sszJFwRK6R0qJ0cxbG4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-638-3ix6zjYxPNG31LuPP5ghUg-1; Wed, 05 Apr 2023 12:04:25 -0400
X-MC-Unique: 3ix6zjYxPNG31LuPP5ghUg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 754B788B7A6;
	Wed,  5 Apr 2023 16:04:24 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5EEF61121314;
	Wed,  5 Apr 2023 16:04:24 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 339301946597;
	Wed,  5 Apr 2023 16:04:24 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id CEA271946587 for <cluster-devel@listman.corp.redhat.com>;
 Wed,  5 Apr 2023 16:04:22 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id BD01D2166B29; Wed,  5 Apr 2023 16:04:22 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B62A62166B26
 for <cluster-devel@redhat.com>; Wed,  5 Apr 2023 16:04:22 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 88C2488B76E
 for <cluster-devel@redhat.com>; Wed,  5 Apr 2023 16:04:22 +0000 (UTC)
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-330-cyF9jCe7OTeWwfIUhfcpxw-1; Wed, 05 Apr 2023 12:04:20 -0400
X-MC-Unique: cyF9jCe7OTeWwfIUhfcpxw-1
Received: by mail-qt1-f197.google.com with SMTP id
 t15-20020a05622a180f00b003e37dd114e3so24610800qtc.10
 for <cluster-devel@redhat.com>; Wed, 05 Apr 2023 09:04:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680710659;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ezrY1MpbuGn54W85nscQkQabj0tChDh4QyAKrhiN160=;
 b=nPObDduCSvY8Jsp12x/3dt1vVgRbCz4YAde+Z+4bP6sCtDKQmpg9YaSG2OIYxfFELx
 YpXBRAL9XvZ8hE9be2LqtRdybJcNZ6Adk/W9UPQxyqZwdPop264A93Q69LqTLSJTHJNt
 dpkR9p33/O8vUgBkX7z5V+mYsygdZotlYx2BnBeFxbGuNUlFGHh6B9FjMPE3dzyc9Pmh
 dRQ/qna2zv3V4NNFAAGfNIofbebI+jVNZoBLwhzW/nOUm6ewbnq3iIgXXhWlCuicQSb+
 KVBJxck+ReWGe1FfJEv0mhalFOhbhGv/MWe+UpPWnG1IAbU+mwjhsNVnuS06DKRcZVVg
 A4jw==
X-Gm-Message-State: AAQBX9dKBJZwbQW9znbX0m1V9d0xZrccHsUT4GoM1zu1utavLsT3KLJa
 D6ag/VI8TzCfmxbZgUVCyuD0El3SH7r+iaNK1B3fFgsgCed5/LCQJmTM3inLh6XQdCMnoj7XTJH
 vWtQUFoHiwuNZ++jR+51n
X-Received: by 2002:a05:622a:4b:b0:3d8:8d4b:c7cc with SMTP id
 y11-20020a05622a004b00b003d88d4bc7ccmr7038037qtw.46.1680710659550; 
 Wed, 05 Apr 2023 09:04:19 -0700 (PDT)
X-Google-Smtp-Source: AKy350a5lKksulKGDz1s6x8IlpR6R6JUlCw8aCDbcTRwKrjAxeI/G0vqKKfr43MPgy1YnBz9zPAfFA==
X-Received: by 2002:a05:622a:4b:b0:3d8:8d4b:c7cc with SMTP id
 y11-20020a05622a004b00b003d88d4bc7ccmr7037982qtw.46.1680710659193; 
 Wed, 05 Apr 2023 09:04:19 -0700 (PDT)
Received: from aalbersh.remote.csb ([109.183.6.197])
 by smtp.gmail.com with ESMTPSA id
 b9-20020ac84f09000000b003e398d00fabsm4083588qte.85.2023.04.05.09.04.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Apr 2023 09:04:18 -0700 (PDT)
Date: Wed, 5 Apr 2023 18:04:13 +0200
From: Andrey Albershteyn <aalbersh@redhat.com>
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <20230405160413.7o7tljszm56e73a6@aalbersh.remote.csb>
References: <20230404145319.2057051-1-aalbersh@redhat.com>
 <20230404233713.GF1893@sol.localdomain>
MIME-Version: 1.0
In-Reply-To: <20230404233713.GF1893@sol.localdomain>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Subject: Re: [Cluster-devel] [PATCH v2 00/23] fs-verity support for XFS
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
Cc: fsverity@lists.linux.dev, linux-xfs@vger.kernel.org,
 linux-ext4@vger.kernel.org, djwong@kernel.org,
 damien.lemoal@opensource.wdc.com, chao@kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, cluster-devel@redhat.com,
 xiang@kernel.org, jth@kernel.org, linux-erofs@lists.ozlabs.org,
 linux-btrfs@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Apr 04, 2023 at 04:37:13PM -0700, Eric Biggers wrote:
> On Tue, Apr 04, 2023 at 04:52:56PM +0200, Andrey Albershteyn wrote:
> > The patchset is tested with xfstests -g auto on xfs_1k, xfs_4k,
> > xfs_1k_quota, and xfs_4k_quota. Haven't found any major failures.
> 
> Just to double check, did you verify that the tests in the "verity" group are
> running, and were not skipped?

Yes, the linked xfstests in cover-letter has patch enabling xfs
(xfsprogs also needed).
> 
> - Eric
> 

-- 
- Andrey

