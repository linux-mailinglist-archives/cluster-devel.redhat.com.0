Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id D1D71777C32
	for <lists+cluster-devel@lfdr.de>; Thu, 10 Aug 2023 17:28:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1691681335;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=s6980iRFYFhljGIDmJ2gYCZUpSgxcLWMQ6gc8L/xTn4=;
	b=Mvts32fWVLUFDLBRfNeIdL/A0OGlKLpmFUG1PwJDSrdi79r36SdQD2n/iXYoCdtN+CcA1q
	n+C99AOvfeoUH6Wsj48UVgngOdB2AnaNYgSYLg57FKNAPwcGj8KVFja8Uhep2RgtG4ymS5
	+3RHCYUS8hy2AzBptDTUsgOsHONJFtQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-35-l6ATHFBdNWGRMP3BehDwKA-1; Thu, 10 Aug 2023 11:28:52 -0400
X-MC-Unique: l6ATHFBdNWGRMP3BehDwKA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4AF49185A794;
	Thu, 10 Aug 2023 15:28:51 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 765B22026D4B;
	Thu, 10 Aug 2023 15:28:49 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id E06FF1946595;
	Thu, 10 Aug 2023 15:28:48 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id B22BE1946588 for <cluster-devel@listman.corp.redhat.com>;
 Thu, 10 Aug 2023 15:28:47 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 9408A40C6F53; Thu, 10 Aug 2023 15:28:47 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8C37C40C6F4E
 for <cluster-devel@redhat.com>; Thu, 10 Aug 2023 15:28:47 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-inbound-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2B2D538149C2
 for <cluster-devel@redhat.com>; Thu, 10 Aug 2023 15:28:47 +0000 (UTC)
Received: from msg-1.mailo.com (msg-1.mailo.com [213.182.54.11]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-279-PjK-CX7JMEGvMN4jVskc8g-1; Thu,
 10 Aug 2023 11:28:44 -0400
X-MC-Unique: PjK-CX7JMEGvMN4jVskc8g-1
Received: by b221-3.in.mailobj.net [192.168.90.23] with ESMTP
 via ip-20.mailobj.net [213.182.54.20]
 Thu, 10 Aug 2023 17:28:41 +0200 (CEST)
X-EA-Auth: p8ndnxxUr5lG6O586wocNfHpv24hbRfuQMOjmPjlABDsjCxaYc2Q/OxfMV0gG7oiwrMWd3JqERNmcvQOqfpUgznVLsely7zB
Date: Thu, 10 Aug 2023 20:58:37 +0530
From: Deepak R Varma <drv@mailo.com>
To: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Message-ID: <ZNUCJV7uKHjgijwh@EBC2204>
References: <cover.1688073459.git.drv@mailo.com>
 <4bed561513ba76486ea3fc87f97e6c646f98cbe7.1688073459.git.drv@mailo.com>
 <2235268.iZASKD2KPV@suse>
MIME-Version: 1.0
In-Reply-To: <2235268.iZASKD2KPV@suse>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Subject: Re: [Cluster-devel] [PATCH v3 6/6] gfs2: Replace kmap_atomic() by
 kmap_local_page() in gfs2_write_buf_to_page
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
Cc: Sumitra Sharma <sumitraartsy@gmail.com>, linux-kernel@vger.kernel.org,
 cluster-devel@redhat.com, Ira Weiny <ira.weiny@intel.com>
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: mailo.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Sat, Jul 01, 2023 at 03:54:06PM +0200, Fabio M. De Francesco wrote:
> On giovedì 29 giugno 2023 23:52:27 CEST Deepak R Varma wrote:
> > kmap_atomic() is deprecated in favor of kmap_local_{folio,page}().
>
> Deepak,
>
> Again please refer to documentation and/or Ira's deprecation patch. The
> reasons why are in one of my previous messages.

Hi Fabio,
This change was already added by Andreas. So my patchset can be dropped.
However, your feedback on the individual patches is agreed to and accepted. I
will keep your suggestions in mind when I submit next patches.

Thank you :)

Deepak.

>
> > Therefore, replace kmap_atomic() with kmap_local_page() in
> > --
> > 2.34.1
>
>
>
>


