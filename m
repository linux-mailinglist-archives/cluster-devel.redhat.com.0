Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 8DC622F32D6
	for <lists+cluster-devel@lfdr.de>; Tue, 12 Jan 2021 15:22:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1610461375;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=i4QNp08jJxmh2s+Zx33DNiC4BuoKLqzbGbWe/BXFWNM=;
	b=RzNiIJvDHDiVTkbBF+rdU5IunQAR0qik49Cv2uxRmAfkf7uPJwngGTJoyQ8mst5tt5KQAp
	t3ggw7cwYM9cvPjsuYVmj/axXJ1YeMWlsYLr6/6VF7TiXDbN7bBD5sjkYBBtCZtG1tHc6K
	LA9eCLqxx3BEuqAIULKZ7nzvIOblOLY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-319-wpg4n-kVP36tnhvS3VhA7Q-1; Tue, 12 Jan 2021 09:22:54 -0500
X-MC-Unique: wpg4n-kVP36tnhvS3VhA7Q-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D0154A0CA0;
	Tue, 12 Jan 2021 14:22:50 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 48BA51002393;
	Tue, 12 Jan 2021 14:22:50 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 92A7818095C9;
	Tue, 12 Jan 2021 14:22:48 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 10CEMijc001155 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 12 Jan 2021 09:22:44 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 5429D10013BD; Tue, 12 Jan 2021 14:22:44 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from [10.33.37.29] (unknown [10.33.37.29])
	by smtp.corp.redhat.com (Postfix) with ESMTP id F2F3F10021B3
	for <cluster-devel@redhat.com>; Tue, 12 Jan 2021 14:22:40 +0000 (UTC)
To: cluster-devel@redhat.com
References: <20210107134240.386547-1-anprice@redhat.com>
From: Andrew Price <anprice@redhat.com>
Message-ID: <b1bc87ee-d47b-ba8f-67e5-af51d9613092@redhat.com>
Date: Tue, 12 Jan 2021 14:22:39 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
	Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210107134240.386547-1-anprice@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: cluster-devel@redhat.com
Subject: Re: [Cluster-devel] [PATCH 0/3] gfs2-utils: New fs format version
 support
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 07/01/2021 13:42, Andrew Price wrote:
> This patch set prepares gfs2-utils for supporting fs format 1802, which is intended to enable trusted.* xattrs and enable rgrplvb by default. mkfs.gfs2 still creates filesystems with format 1801 by default.
> 
> Andrew Price (3):
>    mkfs.gfs2: Add extended option for specifying format version
>    fsck.gfs2: Enable checking of format 1802
>    tunegfs2: Add support for fs format versions

I've pushed these patches to gfs2-utils/master to ease testing the 
kernel patches. mkfs.gfs2 will continue to create format 1801 
filesystems by default until gfs2_ondisk.h kernel header is updated, but 
format 1802 can be tested using 'mkfs.gfs2 -o format=1802 ...' or 
'tunegfs2 -r 1802 ...' for existing filesystems (subsequent downgrading 
is not supported).

Andy

