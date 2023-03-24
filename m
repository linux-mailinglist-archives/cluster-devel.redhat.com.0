Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id C38AA6C76D7
	for <lists+cluster-devel@lfdr.de>; Fri, 24 Mar 2023 06:10:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1679634640;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=TFy8BnEMdIxgOU7IwMhMUHuxgqnQwaVzZQzG8h7D3xpc6NYm/HRewBv9LPv3V7OTG/NJrF
	LRoj07NoWtG/bPAkS0mn5fgbt15ZzI3tsHiOzftpQhewj7TBzyP/qi9kgxydDNA/HoKf3z
	STBDGBzuZdBIr9zpegF3Pp7aLUjH+Ns=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-475-tQJN5T-yNay21gfS9B7eSA-1; Fri, 24 Mar 2023 01:10:36 -0400
X-MC-Unique: tQJN5T-yNay21gfS9B7eSA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AF71C38221E0;
	Fri, 24 Mar 2023 05:10:35 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1FCE12166B2D;
	Fri, 24 Mar 2023 05:10:34 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id CA0921946A40;
	Fri, 24 Mar 2023 05:10:33 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 794951946587 for <cluster-devel@listman.corp.redhat.com>;
 Fri, 24 Mar 2023 05:10:32 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 1B88E2166B2A; Fri, 24 Mar 2023 05:10:32 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 14A462166B29
 for <cluster-devel@redhat.com>; Fri, 24 Mar 2023 05:10:32 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E814C29AA2C0
 for <cluster-devel@redhat.com>; Fri, 24 Mar 2023 05:10:31 +0000 (UTC)
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-557-jc2tYI1lN0eWQ8fOfORu8g-1; Fri, 24 Mar 2023 01:10:25 -0400
X-MC-Unique: jc2tYI1lN0eWQ8fOfORu8g-1
Received: by mail-pj1-f72.google.com with SMTP id
 ie7-20020a17090b400700b0023f06808981so299797pjb.8
 for <cluster-devel@redhat.com>; Thu, 23 Mar 2023 22:10:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679634622;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
 b=Rq+SWuzy2rPH3bXCFDN822V6L6uWNcSZNCMNi4GjLnRYryGv6fCoHD4URFbALQ01R2
 ZsCvD5qPJV1towau/mnU1xqoBStzejiMDE9YBk+XnFNC5eCZLKW4hvIviJItE/+oURlk
 qG2SrEvZKMJxrdxVgJq252ZMKFU7eCJkDpjAq6mdy4r/A1xFpP3RpZW7dChqdnU/23e1
 vQElxzIRSco2RVpRuKR+sJmi1DJhPwgIXXdhq+jFpSNOGwyblbt5Wll6GESrlpfib6pP
 SSe9oPmXf5of0iJ/e3poEq7pqZ1mpK1vpU/jYUNGtsfiYaUzEGdY8JT6WYGKpML5XZn+
 5SLw==
X-Gm-Message-State: AAQBX9fdx4soZTyY/NbpBrwiwHQAjnOR0xoUygM+wEBAMlnpitB/5W5/
 /vNPXiPcXXW3SbpAKtuoetJ0i8qgh5ZHWLgtnnE336l2EtzyBRI4tZjP/JYC2bj6+sPIIGsuMsn
 nChneVgcWbhqt+jw1/GJ0gkHAms4YtpYtqk95Rzmwy/OWaQ==
X-Received: by 2002:a17:902:a516:b0:1a1:ffc8:d52e with SMTP id
 s22-20020a170902a51600b001a1ffc8d52emr475125plq.8.1679634622634; 
 Thu, 23 Mar 2023 22:10:22 -0700 (PDT)
X-Google-Smtp-Source: AKy350bITIQYU1pEww2l0wIqCHELxxLM2yee/447JVitllV/HHOHeuZM/ZcS75Jdc1HW1kxpZ4RpnQnE4BbGl4TkyeI=
X-Received: by 2002:a17:902:a516:b0:1a1:ffc8:d52e with SMTP id
 s22-20020a170902a51600b001a1ffc8d52emr475123plq.8.1679634622339; Thu, 23 Mar
 2023 22:10:22 -0700 (PDT)
MIME-Version: 1.0
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Fri, 24 Mar 2023 06:10:10 +0100
Message-ID: <CAHc6FU4qeELJ7pFsXxcmnAsspr=8Ta9Q7gENj_BguxvMCNsEZA@mail.gmail.com>
To: Andreas Gruenbacher <agruenba@redhat.com>,
 cluster-devel <cluster-devel@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Subject: [Cluster-devel] Andy gfs2 patches?
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"


