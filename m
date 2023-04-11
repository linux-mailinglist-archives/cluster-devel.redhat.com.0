Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F1216DE213
	for <lists+cluster-devel@lfdr.de>; Tue, 11 Apr 2023 19:13:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1681233192;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=PkDxXhCURA0xZkghCb9fJIIPnU+rSWqgrkKvVj1877A=;
	b=Dy3EIbDOvSqaotgMY9Rj8L8s487G+C/bJVQBow0PnDz5nJ7TF7iXUuxzs8di5JONvn5iT1
	BkuZW2a6mpSllmnVidKVBfopCzz9vGBUsLtNQIOuJ7zq7ebHWKXhYFRm8fJEZt+o/MJ+Wg
	5lmKYv+SKbD79T3nQqvrkqnnRv6iW34=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-505-A87HT4gxNvKZSV1QPuNmSw-1; Tue, 11 Apr 2023 13:13:08 -0400
X-MC-Unique: A87HT4gxNvKZSV1QPuNmSw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F24F71C0952B;
	Tue, 11 Apr 2023 17:13:06 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6728847CDC;
	Tue, 11 Apr 2023 17:13:06 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 06CBB1946A44;
	Tue, 11 Apr 2023 17:12:56 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 49FAE19466DF for <cluster-devel@listman.corp.redhat.com>;
 Tue, 11 Apr 2023 17:12:12 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id C1F62492C14; Tue, 11 Apr 2023 17:12:12 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B97C7492C13
 for <cluster-devel@redhat.com>; Tue, 11 Apr 2023 17:12:12 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9C4C93C10C69
 for <cluster-devel@redhat.com>; Tue, 11 Apr 2023 17:12:12 +0000 (UTC)
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-124-Dszbx4B3ME2xr4WsRDftnw-1; Tue, 11 Apr 2023 13:12:11 -0400
X-MC-Unique: Dszbx4B3ME2xr4WsRDftnw-1
Received: by mail-qt1-f199.google.com with SMTP id
 f2-20020ac87f02000000b003e6372b917dso24509382qtk.3
 for <cluster-devel@redhat.com>; Tue, 11 Apr 2023 10:12:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681233131;
 h=content-transfer-encoding:content-language:to:subject:from
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=PkDxXhCURA0xZkghCb9fJIIPnU+rSWqgrkKvVj1877A=;
 b=CivwN9YHlhx197f7F9PX7GtzUTQfL+sUtXGhehAI9uDfykaII4btaXxxB+a47CbqDf
 +J/SxDp8GZvHFLjidlup9z3kRh4GII6YU8zloPisfH118B3HnppLt+McbfOZSuLdryeU
 XNYh6lCSvgp6K5R0KLk+sjgL0yfgJvMgs+S0PYzw4S+qKDBaCDsc4WM5ruqWe/WKFD+k
 6bx4vdFdXD33P2uKaK6MYL4Y43tluuNzdunPJDXdpHgI5RdLmfbLzFxjrD6aFI8MNSn6
 2D6wZu90aZKOCgLNHj1z18PA7C/rDy8xODRdjx/0NeEo6wbTmztuCuj3QEb9EhkhYMAc
 eoRA==
X-Gm-Message-State: AAQBX9eNQ/wbNN5wERHiwqDSlRXrOu3RDP0/RhJGAH0apoHok0TejuVE
 qYs7106aJi8Ox9we+hLafPLn1vZERnzTR3IR2TaVwBEq2YCWMhdL5sL5KOG5BKgJG6RTijzBVdH
 228WAi2VI42DySECXcOyfhu53vlI+kvenqyPIWD6PFthaB3/WFyNdFTh06S2GOA4jyVVlPJGjie
 7lOO4t
X-Received: by 2002:a05:622a:1888:b0:3d9:525d:f024 with SMTP id
 v8-20020a05622a188800b003d9525df024mr18628651qtc.28.1681233130909; 
 Tue, 11 Apr 2023 10:12:10 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZMTkEd9AfJXeiLyoKien/1wFq03cvlOHVwzLL+kWXQqudV+HAVlgcu+aiAGtUDitxzfyHPBw==
X-Received: by 2002:a05:622a:1888:b0:3d9:525d:f024 with SMTP id
 v8-20020a05622a188800b003d9525df024mr18628608qtc.28.1681233130566; 
 Tue, 11 Apr 2023 10:12:10 -0700 (PDT)
Received: from [192.168.1.165]
 (cpc76484-cwma10-2-0-cust967.7-3.cable.virginm.net. [82.31.203.200])
 by smtp.gmail.com with ESMTPSA id
 z16-20020ac86b90000000b003e69c51cf53sm2069605qts.72.2023.04.11.10.12.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Apr 2023 10:12:10 -0700 (PDT)
Message-ID: <46046b3f-229b-262a-7279-1ad89226f2b7@redhat.com>
Date: Tue, 11 Apr 2023 18:12:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
From: Andrew Price <anprice@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>,
 Cluster Labs - All topics related to open-source clustering welcomed
 <users@clusterlabs.org>, developers@clusterlabs.org
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Subject: [Cluster-devel] gfs2-utils 3.5.1 released
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
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

gfs2-utils contains the tools needed to create, check, modify and 
inspect gfs2 filesystems along with support scripts needed on every gfs2 
cluster node.

This minor release includes fixes for a small number of issues 
discovered in 3.5.0, including test failures that occur on 32-bit 
architectures and when compiling with specific gcc versions with 
link-time optimization enabled.

The full git shortlog is below.

Release tarballs and signed checksums can be found here:

https://releases.pagure.org/gfs2-utils/

Direct link for convenience:

https://releases.pagure.org/gfs2-utils/gfs2-utils-3.5.1.tar.gz

Please report bugs to the cluster-devel@redhat.com mailing list or at:

https://bugzilla.kernel.org/enter_bug.cgi?product=File%20System&component=gfs2

Patches or pull requests can be sent to the same list or submitted on 
Pagure:

https://pagure.io/gfs2-utils

Thanks,
Andy

gfs2-utils changes since 3.5.0:

Andrew Price (9):
       Update version for development
       gfs2_edit: Fix savemeta test failures in 32-bit environments
       gfs2_jadd: Fix format string warnings on 32-bit
       libgfs2: Fix strict-aliasing warning in lgfs2_rgrp_bitbuf_alloc
       gfs2_convert: Clean up strict-aliasing warnings
       Re-enable -Wstrict-aliasing
       libgfs2: Separate gfs and gfs2 code in lgfs2_sb_out()
       Don't use char arrays as temporary buffers
       Prepare for version 3.5.1

