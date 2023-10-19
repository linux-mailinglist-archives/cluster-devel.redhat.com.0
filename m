Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id C1C0B7D0B36
	for <lists+cluster-devel@lfdr.de>; Fri, 20 Oct 2023 11:12:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1697793163;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=XEW0SGr4MbR9CQVpzv4tkcFfYyLm9TH0drmlL9slatc=;
	b=Z0h1BHJIgAAmaRzzDZ9lRfkFRHPShcowyUIv0tLRTVqU7LoVRmsA4ZHEyeszL8tGu58Utf
	8CmpK9feKCtmHo+EKBbRwQ7gHk11OsIDx9BW/sFaK+goSOXfsiKoWnSQHuhBW9bAFVxqgC
	AcJxfQRdOeZ2WXeD43kWk2owCHdsIXY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-252-5rq0mePQP2KVgCPDxAD_zg-1; Fri, 20 Oct 2023 05:12:40 -0400
X-MC-Unique: 5rq0mePQP2KVgCPDxAD_zg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5004F8115B1;
	Fri, 20 Oct 2023 09:12:39 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 93BBC8CF2;
	Fri, 20 Oct 2023 09:12:34 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 7E3EA1946A75;
	Fri, 20 Oct 2023 09:12:33 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 67E4A1946A5E for <cluster-devel@listman.corp.redhat.com>;
 Thu, 19 Oct 2023 12:28:25 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 282E3908; Thu, 19 Oct 2023 12:28:20 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2111F8AF
 for <cluster-devel@redhat.com>; Thu, 19 Oct 2023 12:28:20 +0000 (UTC)
Received: from us-smtp-inbound-delivery-1.mimecast.com
 (us-smtp-inbound-delivery-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E6AEA2815E37
 for <cluster-devel@redhat.com>; Thu, 19 Oct 2023 12:28:19 +0000 (UTC)
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-618-GAbfh0hAOwi5-7d9OIBKGg-1; Thu, 19 Oct 2023 08:28:18 -0400
X-MC-Unique: GAbfh0hAOwi5-7d9OIBKGg-1
Received: by mail-yw1-f199.google.com with SMTP id
 00721157ae682-5a8d9dcdd2bso11859567b3.2
 for <cluster-devel@redhat.com>; Thu, 19 Oct 2023 05:28:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697718497; x=1698323297;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=XEW0SGr4MbR9CQVpzv4tkcFfYyLm9TH0drmlL9slatc=;
 b=wL+xoZoYa8bkpaOHU5/ais0j3/OiaIpqnoeXheGuT/cLpurK39K15bFwfZjqzCF4tx
 jPNobvshGia1GWQGNbWNgxh99JUZp9TVBV2p8emUSEZHynwFsVsKWL+BZ6MtptXzH2+j
 6FxpAlWJSkEX1ybW2DgX1LAKDHPYaFQXTvhKHSLGHVGEAV4KIWdge5kFy/jFOYgjFEoW
 fyXeaPVovOwdxTmqSJkvf7vGF85rassKIpGy3JwztHAgiW1yYwUzdUUJUo5Qzr0UBqyE
 SXwh4tWutP46ylPSMgeXPR8MV2tjvL9ttZeLN47Ml66MJE5UrApJt1w9E6UP+boTpCzp
 HMmw==
X-Gm-Message-State: AOJu0YwfUVVZ3hEvNfZmGy2RBjOTD92N/fX5uGdZO+ktlzezSx3qSEUg
 hKIGDAby0DmKsw1HHcxFFlCvwPY4I4sQ7lMPpZ2cbqrJfbb0mnAFajZaOXW2tVdbN2SdA7Ch2U+
 2EbTnOhy8/A1m4pYlqswiVA==
X-Received: by 2002:a25:9802:0:b0:d9a:4fa0:dca9 with SMTP id
 a2-20020a259802000000b00d9a4fa0dca9mr1959646ybo.25.1697718497666; 
 Thu, 19 Oct 2023 05:28:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFsBhf8CkOk5LzOFaZntyg+KF/j0oUcdZXQZzrNvkHBmp4jM6uNdGp07fJUfPbFCGQ8CVNaTw==
X-Received: by 2002:a25:9802:0:b0:d9a:4fa0:dca9 with SMTP id
 a2-20020a259802000000b00d9a4fa0dca9mr1959632ybo.25.1697718497403; 
 Thu, 19 Oct 2023 05:28:17 -0700 (PDT)
Received: from [192.168.1.165]
 (cpc76484-cwma10-2-0-cust967.7-3.cable.virginm.net. [82.31.203.200])
 by smtp.gmail.com with ESMTPSA id
 e13-20020ad450cd000000b0065cffe12ae9sm740160qvq.36.2023.10.19.05.28.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Oct 2023 05:28:16 -0700 (PDT)
Message-ID: <be0ce0c5-5278-4d29-94d2-e5ce26e8e3b5@redhat.com>
Date: Thu, 19 Oct 2023 13:28:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Julia Lawall <julia.lawall@inria.fr>
References: <a8791f89-ed7b-1649-3b53-72349899c5d@inria.fr>
From: Andrew Price <anprice@redhat.com>
In-Reply-To: <a8791f89-ed7b-1649-3b53-72349899c5d@inria.fr>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.1
X-Mailman-Approved-At: Fri, 20 Oct 2023 09:12:31 +0000
Subject: Re: [Cluster-devel] [gfs2:extents 14/14]
 fs/gfs2/extents.c:123:23-27: WARNING use flexible-array member instead
 (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)
 (fwd)
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
Cc: gfs2@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.5
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 19/10/2023 06:27, Julia Lawall wrote:
> 
> 
> ---------- Forwarded message ----------
> Date: Thu, 19 Oct 2023 05:56:44 +0800
> From: kernel test robot <lkp@intel.com>
> To: oe-kbuild@lists.linux.dev
> Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
> Subject: [gfs2:extents 14/14] fs/gfs2/extents.c:123:23-27: WARNING use
>      flexible-array member instead
>      (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-
>      and-one-element-arrays)
> 
> BCC: lkp@intel.com
> CC: oe-kbuild-all@lists.linux.dev
> CC: cluster-devel@redhat.com

The lkp-tests contact info is out of date. I've opened a PR to fix it at 
https://github.com/intel/lkp-tests/pull/319 but it should probably use 
the latest MAINTAINERS file always. CCing the new gfs2 list.

Thanks,
Andy

> TO: Andreas Gruenbacher <agruenba@redhat.com>
> 
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gfs2/linux-gfs2.git extents
> head:   86474c69cac46872bd311318c02fb8e9e25abd10
> commit: 86474c69cac46872bd311318c02fb8e9e25abd10 [14/14] gfs2: Add some initial extents-based inode code
> :::::: branch date: 9 days ago
> :::::: commit date: 9 days ago
> config: x86_64-randconfig-101-20231018 (https://download.01.org/0day-ci/archive/20231019/202310190541.0impmnL4-lkp@intel.com/config)
> compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
> reproduce: (https://download.01.org/0day-ci/archive/20231019/202310190541.0impmnL4-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Julia Lawall <julia.lawall@inria.fr>
> | Closes: https://lore.kernel.org/r/202310190541.0impmnL4-lkp@intel.com/
> 
> cocci warnings: (new ones prefixed by >>)
>>> fs/gfs2/extents.c:123:23-27: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)
> 
> vim +123 fs/gfs2/extents.c
> 
> 86474c69cac468 Andreas Gruenbacher 2021-03-25  115
> 86474c69cac468 Andreas Gruenbacher 2021-03-25  116  /*
> 86474c69cac468 Andreas Gruenbacher 2021-03-25  117   * The path components in struct gfs2_extent_path are stored in "reverse"
> 86474c69cac468 Andreas Gruenbacher 2021-03-25  118   * order: the leaf is stored first, and when the tree grows at the root,
> 86474c69cac468 Andreas Gruenbacher 2021-03-25  119   * this happens at the end of the array.
> 86474c69cac468 Andreas Gruenbacher 2021-03-25  120   */
> 86474c69cac468 Andreas Gruenbacher 2021-03-25  121  struct gfs2_extent_path {
> 86474c69cac468 Andreas Gruenbacher 2021-03-25  122  	unsigned int p_height;
> 86474c69cac468 Andreas Gruenbacher 2021-03-25 @123  	struct gfs2_extent_pc p_pc[1];
> 86474c69cac468 Andreas Gruenbacher 2021-03-25  124  };
> 86474c69cac468 Andreas Gruenbacher 2021-03-25  125
> 

